open Vector3

(* Type describing object's parameters associated with its presence in 3D space *)
type transform =
{
	position : vector3 ref; (* position in 3D space *)
	rotation : vector3 ref; (* rotation expressed in Euler angles *)
	scale 	 : vector3 ref; (* scaling of the object along its 3 axes *)
	rotation_inverse : vector3 ref; (* precalculated inverse rotation for optimization purposes *)
	scale_inverse 	 : vector3 ref; (* precalculated inverse scale for optimization purposes *)
}

let transform_default (x : unit) =
{
	position = ref vector3_zero;
	rotation = ref vector3_zero;
	scale =    ref vector3_one;
	rotation_inverse = ref vector3_zero;
	scale_inverse = ref vector3_one;
}

let setPosition (tran : transform) (vec : vector3) =
	tran.position := vec

let setRotation (tran : transform) (vec : vector3) =
	tran.rotation := vec
	(* TODO: calculate rotation inverse *)

let setScale (tran : transform) (vec : vector3) =
	tran.scale := vec;
	tran.scale_inverse := { x = 1. /. vec.x; y = 1. /. vec.y; z = 1. /. vec.z }

(* Returns position of [point] if [trans]'s frame of reference *)
let relative_to_transform (trans : transform) (point : vector3) =
	(point -- !(trans.position)) *** !(trans.scale_inverse)