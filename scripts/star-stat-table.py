#!/usr/bin/python 

import string
import sys

fileList = sys.argv[1:]
help = "\nProduces CSV for STAR summary files. Writes to STDOUT.\n"
help = help + "Usage: " + sys.argv[0] + " <*.final.out>\n"
if len(fileList) < 2:
	sys.exit(help)

#print fileList
afile = fileList[0]

#Sets up the list of labels, and establishes value lists from the first file.
labelList=["File"]
valList=[[afile]]
for line in open(afile):
	cols = line.rstrip().split('\t')
	col1 = ''.join(cols[0])
	#Removes junk from the labels
	col1 = col1.replace("|",'')
	col1 = col1.replace(",",'')
	col1=col1.strip()
	if len(cols) > 1:
		col2 = ''.join(cols[1])
	else:
		col2 =''
	labelList.append(col1)
	valList.append([col2])

#Loops through the file list and appends the values for each row to the value list.
for thefile in fileList[1:]:
	valList[0].append(thefile)
	linecount=1
	for line in open(thefile):
		cols = line.rstrip().split('\t')
		if len(cols) > 1:
			col2 = ''.join(cols[1])
		else:
			col2 =''
		valList[linecount].append(col2)
		linecount += 1

#Writes the output to a file by looping through the list indices.	
#writefile = open('starstats.csv','w')
for x in range(0,len(labelList)):
	label = labelList[x]
	allVals = valList[x]
	if label != '':
		for aval in allVals:
			if aval !='':
				label = label + ',' + aval
		print label

#Closes the writefile.
#writefile.close()
