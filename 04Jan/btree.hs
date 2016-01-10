
add-vertex v  g =
	if length [ x | x <- g , fst x == v] > 0
		then g
	else
		(v, []) : g

add-edge x y g =
	sublist = [ snd v | v <- g , fst v == x]

	if length sublist > 0
		then
		list = sublist !! 0
		if y `elem` list
	 		then g
	 	else
	 		[if fst v == x then (x, y:(snd v)) else v | v <- g]
	 else
	 	add-edge x y add-vertex x g


