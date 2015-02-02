#!/usr/bin/env python
# vim: set fileencoding=utf8

import sys
import argparse

def filter (path, dest):
	source = open(path)
	data = []
	while 1:
		line = source.readline()
		if not line:
			break
		data.append(line)

	print 'origin items count:' + str(len(data))
	data = set(data)
	print 'result items count:' + str(len(data))
	
	sort = []
	for line in data:
		sort.append(line)
	
	target = open(dest + '.txt', 'a')
	sort.sort()
	for line in sort:
		target.write(line)

	print '\nnew generate file store to ' + dest + '.txt in the same directory.'

def main():
	description = ''' run for filter duplicated items.

	use this:
	{self_name} --path path --name name'''.format(self_name = sys.argv[0])

	parser = argparse.ArgumentParser(description = '', formatter_class = argparse.RawDescriptionHelpFormatter,)
	parser.add_argument('--path', action = 'store', help = 'path of file to filter.')
	parser.add_argument('--name', action = 'store', help = 'name to store new file.')
	args = parser.parse_args()

	config_value = []
	if args.path and args.name :
		print 'Path:' + args.path + '\nBegin Filter...'
		filter(args.path, args.name)
		print 'Filter End.'
	else:
		print parser.print_help();
		print 'error, please check arguments.'

if __name__ == '__main__':
	main()
