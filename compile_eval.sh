cd src
ocamlfind ocamlopt -linkpkg \
	-package graphics \
	vector3.ml \
	transform.ml \
	gameobject.ml \
	eval.ml \
	-o ../build/eval

cd ..
bash clean_src.sh
