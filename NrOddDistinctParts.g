NrOddDistinctPartsByK := function(n, k)
    local p, i, j;
    p := List([1..n], _ -> List([1..k], _ -> 0));
    for i in [1..n] do
        for j in [1..k] do
            if i = 1 and j = 1 then
                p[i][j] := 1;
            else
                if i > 2 * j then
                    p[i][j] := p[i][j] + p[i - 2 * j][j];
                fi;
                if i > 2 * j - 1 and j > 1 then
                    p[i][j] := p[i][j] + p[i - (2 * j - 1)][j - 1];
                fi;
            fi;
        od;
    od;
    return p[n][k];
end;;

NrOddDistinctParts := function(n)
	local i, result;
	
	result := 0;
	for i in [1..n] do
		result := result + NrOddDistinctPartsByK(n, i);
	od;
	
	return result;
end;;

NrMod4Parts := function(n)
	local i, num, eq, result;
	
	result := 0;
	eq := n mod 4;
	num := RootInt(n);
	
	for i in [1..num] do
		if eq = (i mod 4) then
			result := result + NrOddDistinctPartsByK(n, i);
		fi;
	od;
	
	return result;
end;;
