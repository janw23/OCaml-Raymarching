open Vector3

(* Defines the signed distance function of a sphere of radius [r] *)
let sphere (r : float) =
	function (vec : vector3) -> (vector3_mag vec) -. r

let repetition (period : float) (shape : vector3 -> float) =
	let rep x y = mod_float (x +. 0.5 *. y) y -. 0.5 *. y in
	function (vec : vector3) ->
		shape (vector3_make (rep vec.x period) (rep vec.y period) (rep vec.z period))