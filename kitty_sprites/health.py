import sys


f = open('out.txt', 'w')

for z in range(10):
	f.write('H' + str(z) + ' = \'{')
	for y in range(24):
		f.write('\'{')

		for x in range(99):

			if (x/11 < z):
				f.write("1")
			else:
				f.write("0")
			if x != 99 -1: f.write(',')

		f.write('}')
		if y != 24 - 1: f.write(',\n')
	f.write("};\n\n")