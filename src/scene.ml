open Vector3
open Worldobject
open Camera
open Distancerules

(* Scene contains information about all present objects *)
(* It is the definition of a particular virtaul world *)
type scene =
{
	worldObjects : worldobject list;
	lightSources : lightsource list;
	mainCamera 	 : camera;
}

let make_scene (cam : camera) = 
	{ worldObjects = []; lightSources = []; mainCamera = cam }

let scene_add_worldobject (scn : scene) (w : worldobject) =
	{ worldObjects = w :: scn.worldObjects; lightSources = scn.lightSources; mainCamera = scn.mainCamera }

(* Returns the maximum safe distance that ray can travel from position [pos] *)
(* and the 'closest' object constraining that distance 						 *)
(* according to the function [rule] (typically it's just 'min' function)	 *)
let getRayStepDistanceObject (scn : scene) (pos : vector3) (rule : float -> float -> float) =
	let rec fold lst dist obj =
		match lst with
		| [] -> (dist, obj)
		| h :: t ->
			let ndist = rule dist (worldobject_distance h pos)
			in fold t ndist (if ndist <= dist then h else obj)
	in fold scn.worldObjects infinity null_worldobject

(* Casts light ray in the scene [scn], originating from point [orig] into the direction [dir] *)
(* Returns the triplet of (the last point before passing [eps] distance from object, that object, hit occured?) *)
(* Assumes no hit occured after travelling [steps] steps *)
(* Maximum safe travel distance is determined according to [rule] *)
let castRay (scn : scene) (orig : vector3) (dir : vector3)
			(rule : float -> float -> float)
			(steps : int) (eps : float) =
	let rec travel pos info step =
		if step = 0 then (info, false) else begin
			let (dist, obj) = getRayStepDistanceObject scn pos rule in
			if dist <= eps then (info, true)
			else travel (pos ++ (dir ** dist)) (pos, obj) (step - 1)
		end
	in travel orig (orig, null_worldobject) steps

(* Returns the color (r, g, b) of a pixel [px, py] cast from mainCamera in scene [scn] *)
let calculatePixel (scn : scene) (px : int) (py : int) =
	(* TODO: add camera rotation *)
	let ((hitpoint, obj), hitoccured) =
		castRay scn !(scn.mainCamera.trans.position) (get_pixel_direction scn.mainCamera px py) min 100 0.001
	in
		if not hitoccured then (0, 0, 0)
		else vector3_to_rgb (obj.color hitpoint) 