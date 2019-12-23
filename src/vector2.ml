(* Type representing a vector in 2-dimensional space *)
type vector2 = 
{
	x : float;
	y : float;
}

exception ZeroDivision

(* Vector addition operator *)
let ( ++ ) (a : vector2) (b : vector2) =
	{ x = a.x +. b.x ; y = a.y +. b.y }

(* Vector subtraction operator *)
let ( -- ) (a : vector2) (b : vector2) =
	{ x = a.x -. b.x ; y = a.y -. b.y }

(* Vecotr-scalar multiplication operator *)
let ( ** ) (v : vector2) (s : float) =
	{ x = s *. v.x ; y = s *. v.y }

(* Vector-scalar division operator *)
let ( // ) (v : vector2) (s : float) =
	if s = 0.0 then raise ZeroDivision else
	{ x = v.x /. s ; y = v.y /. s }

(* Vector-vector componentwise multiplication *)
let ( *** ) (a : vector2) (b : vector2) =
	{ x = a.x *. b.x ; y = a.y *. b.y }

let vector2_make a b = { x = a ; y = b }

let string_of_vector2 (v : vector2) = 
	"(" ^ (string_of_float v.x) ^ "; " ^ (string_of_float v.y) ^ ")"

let vector2_zero = { x = 0.; y = 0. }
let vector2_one  = { x = 1.; y = 1. } 