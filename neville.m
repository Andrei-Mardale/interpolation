%uses Neville method to find P = f(p)
function [P] = neville (x, y, p)
	#init
	l = length(x);
	temp1 = y;
	temp2 = temp1; #buffer
	
	for i = 1:l-1
		for j = 1:l-i
			temp2(j) = ((p - x(j+i)) * temp1(j) - (p - x(j)) * temp1(j+1)) / (x(j) - x(j+i));
		endfor
		temp1 = temp2(1:l-i);
	endfor

	P = temp1;
endfunction
