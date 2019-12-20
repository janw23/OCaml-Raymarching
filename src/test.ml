open Graphics;;

open_graph " 500x500";;

set_color (rgb 120 40 140);;

try
	while true do
		plot (Random.int 500) (Random.int 500)
	done
with Exit -> ()