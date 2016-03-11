%returns V = f(v) where f is the determined linear function
function [V] = linear_spline(x, y, v)
	l = length(x);
	pos = 1; #index for V
	
	v(length(v) + 1) = x(l)+1; #stopping condition
	
	for p = 1:l-1
		aux = x(p+1) - x(p);
		a = (y(p+1) - y(p)) / aux;
		b = (x(p+1) * y(p) - x(p) * y(p+1)) / aux;
		while (v(pos) <= x(p+1))
			V(pos) = a * v(pos) + b;
			++pos;
		endwhile
	endfor
	
	v = v(1:length(v)-1);
endfunction
