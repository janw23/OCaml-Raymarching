cd src
ocamlfind ocamlopt -linkpkg \
	-package graphics \
	vector3.ml \
	vector2 \
	transform.ml \
	worldobject.ml \
	camera.ml \
	scene.ml \
	eval.ml \
	-o ../build/eval

cd ..
bash clean_src.sh
