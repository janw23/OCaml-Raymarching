(* Type representing a vector in 3-dimensional space *)
type vector3 = 
{
	x : float;
	y : float;
	z : float;
}

exception ZeroDivision

(* Vector addition operator *)
let ( ++ ) (a : vector3) (b : vector3) =
	{ x = a.x +. b.x ; y = a.y +. b.y ; z = a.z +. b.z }

(* Vector subtraction operator *)
let ( -- ) (a : vector3) (b : vector3) =
	{ x = a.x -. b.x ; y = a.y -. b.y ; z = a.z -. b.z }

(* Vecotr-scalar multiplication operator *)
let ( ** ) (v : vector3) (s : float) =
	{ x = s *. v.x ; y = s *. v.y ; z = s *. v.z }

(* Vector-scalar division operator *)
let ( // ) (v : vector3) (s : float) =
	if s = 0.0 then raise ZeroDivision else
	{ x = v.x /. s ; y = v.y /. s ; z = v.z /. s }

(* Vector-vector componentwise multiplication *)
let ( *** ) (a : vector3) (b : vector3) =
	{ x = a.x *. b.x ; y = a.y *. b.y ; z = a.z *. b.z }

let vector3_make a b c = { x = a ; y = b ; z = c }

(* Returns the length of the vector *)
let vector3_mag { x = vx; y = vy; z = vz } =
	sqrt (vx *. vx +. vy *. vy +. vz *. vz)

(* Returns the vector with the same direction but length of 1 *)
let vector3_normalized (vec : vector3) =
	vec // (vector3_mag vec)

let string_of_vector3 (v : vector3) = 
	"(" ^ (string_of_float v.x) ^ "; " ^ (string_of_float v.y) ^ "; " ^ (string_of_float v.z) ^ ")"

let vector3_to_rgb { x = vx; y = vy; z = vz } =
	(int_of_float (255. *. vx), int_of_float (255. *. vy), int_of_float (255. *. vz))

let vector3_zero = { x = 0.; y = 0.; z = 0. }
let vector3_one 	= { x = 1.; y = 1.; z = 1. } 