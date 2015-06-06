operands = [-1,0,1]

for a in operands:
	for b in operands:
		print("%d or %d = %d" % (a, b, a or b))
