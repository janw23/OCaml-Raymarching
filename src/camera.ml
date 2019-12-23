open Vector2
open Vector3
open Transform
open Array

type lightsensor =
{
	resolution : int * int; (* count of pixels in each direction *)
	worldsize : vector2;  (* sensor's size in world size units *)
	offset : float; 	  (* sensor's offset forward from camera's position *)
	(* Precomputed optimizations *)
	pixeldirs : vector3 array array; (* directions from camera origin towards each pixel *)
}

type camera =
{
	name : string;
	trans : transform;
	sensor : lightsensor;
}

let first (a, _) = a
and second (_, b) = b

let sqrmag x y = sqrt (x *. x +. y *. y)

(* Return the matrix of direction vectors towards each pixel in sensor *)
let calculatePixelDirs resolution (worldsize : vector2) offset =
	let dirs = make_matrix (first resolution) (second resolution) vector3_zero in
	for x = 0 to (first resolution) - 1 do
		for y = 0 to (second resolution) - 1  do
			let px = ((float_of_int x) /. (float_of_int (first  resolution)) -. 0.5) *. worldsize.x
			and py = ((float_of_int y) /. (float_of_int (second resolution)) -. 0.5) *. worldsize.y in
			dirs.(x).(y) <- vector3_normalized (vector3_make px py offset)
		done
	done;
	dirs

(* Creates new lightsensor and calculates pixeldirs *)
let make_lightsensor (resX, resY) (wsize : vector2) (_offset : float) =
	{ resolution = (resX, resY); worldsize = wsize; offset = _offset;
	  pixeldirs = calculatePixelDirs (resX, resY) wsize _offset }

(* Creates new camera with given parameters *)
let make_camera _name res wsize offset =
	{ name = _name; trans = transform_default (); sensor = make_lightsensor res wsize offset }

(* Returns the direction vector intersecting the pixel [px, py] *)
let get_pixel_direction (cam : camera) (px : int) (py : int) =
	(* TODO: add rotation of the camera *)
	cam.sensor.pixeldirs.(px).(py)