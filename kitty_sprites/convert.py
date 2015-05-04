from PIL import Image
import sys

argv = sys.argv
if len(argv) != 2:
	print "Invalid arguments"


img = Image.open(argv[1] + '.png')
pixel = img.load()
size = img.size

f = open(argv[1] + '.txt', 'w')
f.write('{')

hashtable = {}
count = 0

for y in range(size[1]):
	f.write('{')

	for x in range(size[0]):

		if pixel[x,y] not in hashtable:
			hashtable[pixel[x,y]] = count
			count = count + 1

		f.write(str(hashtable[pixel[x,y]]))
		if x != size[0] -1: f.write(',')

	f.write('}')
	if y != size[1] - 1: f.write(',\n')

f.write("}")