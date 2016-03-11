%opens input and returns m and n
function [fid m n] = openInput(filename)
	#open and check file
	[fid msg] = fopen(filename, "r");
	if (fid < 0)
		disp(msg);
		return
	endif
	
	#buffer which is directly converted to numerical vector
	buff = str2num(fgetl(fid));	
	m = buff(1);
	n = buff(2);
endfunction
	
