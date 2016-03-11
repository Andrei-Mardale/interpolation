function [] = FB()
	[fid m n] = openInput('totti.txt');
	if (fid < 0)
		return
	endif
	
	hold on;
	
	for p = 1:n
		[x y] = readLine(fid);
		v = linspace(x(1), x(length(x)), m);

		V = cubic_splineC(x, y, v);

		plot(v, V);
	endfor
	
	hold off;
	fclose(fid);
endfunction
