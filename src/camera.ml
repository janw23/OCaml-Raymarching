open Vector2
open Transform

type lightsensor =
{
	
}

type camera =
{
	name : string;
	trans : transform;
}

(* Creates new camera with given parameters *)
let make_camera _name =
	{ name = _name; trans = transform_default () }