%read a line from input returing vectors x and y
function [x y] = readLine(fid);
	buff = str2num(fgetl(fid)); #get direct numerical input
	l = length(buff);
	aux = l / 2;
	x = buff(1:aux);
	y = buff(aux+1:l);
	
	#sort for x
	A = [x' y'];
	A = sortrows(A, 1);
	x = A(:,1);
	y = A(:,2);
endfunction
