open Vector3
open Transform

type worldobject =
{
	name : string;
	trans : transform;
	dist : vector3 -> float;
	color : vector3 -> vector3;
}

type lightsource =
{
	name : string;
	trans : transform;
}



(* Creates new worldobject with given parameters *)
let make_worldobject _name _dist _color =
	{ name = _name; trans = transform_default (); dist = _dist; color = _color }

(* worldobject symbolizing null version of worldobject *)
let null_worldobject = make_worldobject "Null" (fun v -> 0.) (fun v -> v)
let is_null_worldobject (w : worldobject) = w = null_worldobject

(* Creates new lightsource with given parameters *)
let make_lightsource _name =
	{ name = _name; trans = transform_default () }

(* Returns the distance between worldobject and [point] accroding to worldobject's dist function *)
let worldobject_distance {name=_; trans=tran; dist=dis; color=_} (point : vector3) =
	dis (relative_to_transform tran point)

(* Returns the color of worldobject at the [point] *)
let worldobject_color {name=_; trans=tran; dist=_; color=col} (point : vector3) =
	col (relative_to_transform tran point)