open Graphics
open Scene
open Camera
open Vector2
open Vector3
open Worldobject
open Transform
open Primitiveshapes;;

open_graph " 200x200";;

let mainCam = make_camera "mainCam" (200, 200) (vector2_make 1. 1.) 2.

let mainScene = make_scene mainCam

let sphereObj = make_worldobject "sphere" (repetition 10. (sphere 1.)) (function v -> vector3_make 1. (mod_float v.y 0.8) 0.);;
setPosition sphereObj.trans (vector3_make 0. 0. (-100.0));;

let mainScene = scene_add_worldobject mainScene sphereObj
;;

let px = ref 0.;;

display_mode false;;
try
	while true do
		for y = 0 to 199 do
			for x = 0 to 199 do
				let (r, g, b) = calculatePixel mainScene x y in 
				set_color (rgb r g b);
				plot x y;
			done
		done;
		synchronize ();
		px := !px +. 1.;
		setPosition mainCam.trans (vector3_make !px 100. 2.)
	done
with Exit -> ()