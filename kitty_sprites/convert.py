from PIL import Image
import sys

argv = sys.argv
if len(argv) != 2:
	print "Invalid arguments"
	sys.exit()


img = Image.open(argv[1] + '.png')
pixel = img.load()
size = img.size

f = open(argv[1] + '.txt', 'w')
f.write('{')

hashtable = {(255, 255, 255, 0): 0,	# backgruond
		   (0, 0, 0, 255): 1,		# black
		   (255, 174, 201, 255): 2,	# pink
		   (74, 74, 74, 255): 3,	# grey
		   (181, 230, 29, 255): 4,	# green
		   (255, 255, 255, 255): 5,	# white
		   (94, 0, 14, 255): 6,		# dark red
		   (136, 0, 21, 255): 7, 	# red
		   (217, 0, 33, 255): 8,	# other red
		   (0, 0, 0, 0): 0
		   }

for y in range(size[1]):
	f.write('{')

	for x in range(size[0]):
		if pixel[x,y] not in hashtable:
			print "Invalid color: " + str(pixel[x,y])
			f.write("x")
		else:
			f.write(str(hashtable[pixel[x,y]]))
		if x != size[0] -1: f.write(',')

	f.write('}')
	if y != size[1] - 1: f.write(',\n')

f.write("}")