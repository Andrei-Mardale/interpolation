%returns V = f(v) where f is the determined cubic function (clamped spline)
function [V] = cubic_splineC(x, y, v)
	l = length(x);
	
	#create tridiagonal system for solving
	#a - lower diagonal
	#b - main diagonal
	#c - upper diagonal
	#d - [.. a b c .. ] * x = d
	a(1) = 0;
	c(1) = x(2) - x(1);
	a(2) = c(1);
	
	b(1) = 2 * c(1);
	d(1) = d(l) = 0;
	for p = 2:l-1
		c(p) = x(p+1) - x(p);
		d(p) = 3 * ((y(p+1) - y(p)) / c(p) - (y(p) - y(p-1))/ a(p));
		b(p) = 2 * (a(p) + c(p));
		a(p+1) = c(p);
	endfor
	b(l) = 2 * a(l);
	
	c = Thomas(a, b, c, d); #solve it

	h = a(2:l); #difference vector

	pos = 1; #index for V
	v(length(v) + 1) = x(l) + 1; #stopping condition
	
	#find values for all points
	for p = 1:l-1
		a = y(p);
		d = (c(p+1) - c(p)) / (3 * h(p));
		b = (y(p+1) - y(p)) / h(p) - h(p) * (2*c(p) + c(p+1)) / 3;
		while (v(pos) <= x(p+1))
			aux = v(pos) - x(p);
			V(pos) = a + b * aux + c(p) * aux ^ 2 + d * aux ^ 3;
			++pos;
		endwhile
	endfor

endfunction
	

		
