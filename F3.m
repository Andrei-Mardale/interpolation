function [] = F3()
	[fid m n] = openInput('realmadrid.txt');
	if (fid < 0)
		return
	endif
	
	hold on;
	
	for p = 1:n
		[x y] = readLine(fid);
		v = linspace(x(1), x(length(x)), m);

		V = cubic_splineN(x, y, v);

		plot(v, V);
	endfor
	
	hold off;
	fclose(fid);
endfunction
