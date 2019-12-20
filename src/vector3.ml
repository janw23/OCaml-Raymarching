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

let string_of_vector3 (v : vector3) = 
	"(" ^ (string_of_float v.x) ^ "; " ^ (string_of_float v.y) ^ "; " ^ (string_of_float v.z) ^ ")"