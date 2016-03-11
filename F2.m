function [] = F2()
	[fid m n] = openInput('barcelona.txt');
	if (fid < 0)
		return
	endif
	
	hold on;
	
	for p = 1:n
		[x y] = readLine(fid);
		
		v = linspace(x(1), x(length(x)), m);
		
		V = linear_spline(x, y, v);

		plot(v, V);
	endfor
	
	hold off;
	fclose(fid);
endfunction
