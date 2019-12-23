cd src
ocamlfind ocamlopt -linkpkg \
	-package graphics \
	vector3.ml \
	vector2.ml \
	transform.ml \
	worldobject.ml \
	camera.ml \
	distancerules.ml \
	primitiveshapes.ml \
	scene.ml \
	test.ml \
	-o ../build/eval

cd ..
bash clean_src.sh
