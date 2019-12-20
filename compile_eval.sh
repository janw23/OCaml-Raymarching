ocamlfind ocamlopt -linkpkg \
	-package graphics \
	src/test.ml -o build/eval
bash clean_src.sh
