open Vector3
open Transform

type gameobject =
	| WorldObject of
		{
			name : string;
			trans : transform;
			dist : vector3 -> float;
			color : vector3 -> vector3;
		}
	| LightSource of
		{
			name : string;
			trans : transform;
		}