NrOddDistinctParts := function(n, k)
	local i, j, p, v;
	
	if n < k or k = 0 then
		return 0;
	fi;
	
	p := [];
	for i in [1..(n + 1)]  do
		v := [];
		for j in [1..k]  do
			v[j] := 1;
		od;
		Add(p, v);
	od;

	for i in [1..(n + 1)] do
		for j in [2..k] do
			if i > 2 * j then
				p[i][j] := p[i - 2 * j][j] + p[i - (2 * j - 1)][j - 1];
			else
				p[i][j] := 0;
			fi;
		od;
	od;
	
	return p[n + 1][k];
end;;

NrMod4Parts := function(n)
	local i, num, eq, result;
	
	result := 0;
	eq := n mod 4;
	num := RootInt(n);
	
	for i in [1..num] do
		if eq = (i mod 4) then
			result := result + NrOddDistinctParts(n, i);
		fi;
	od;
	
	return result;
end;;