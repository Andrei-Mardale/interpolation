function [] = F1()
	[fid m n] = openInput('dodel.txt');
	if (fid < 0)
		return
	endif
	
	hold on;
	
	for p = 1:n
		[x y] = readLine(fid);
		v = linspace(x(1), x(length(x)), m);
		
		#get value for every point
		for k = 1:m
			V(k) = neville(x, y, v(k));
		endfor
		
		plot(v, V);
	endfor
	
	hold off;
	fclose(fid);
endfunction
