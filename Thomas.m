%solves a tridiagonal system
%a, b, c - the three diagonals
%d - free vector
%a, b, d - length n
%c - length n-1
function [x] = Thomas (a, b, c, d)
	#init
	n = length(b);
	c(1) /= b(1);
	d(1) /= b(1);
	
	for i = 2:n-1
		#optimize
		temp = b(i) - c(i-1) * a(i);
		
		c(i) /= temp;
		d(i) = (d(i) - d(i-1) * a(i)) / temp;
	endfor
	
	d(n) = (d(n) - a(n) * d(n-1)) / (b(n) - c(n-1) * a(n));
	
	#start solving (back substitution
	x(n) = d(n);
	for i = n-1:-1:1
		x(i) = d(i) - c(i) * x(i+1);
	endfor
	
	x = x';
endfunction
