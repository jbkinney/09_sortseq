#!/usr/bin/env python2.7
import os, sys

# Load primer sequences
print('Loading primer sequences...')
g = open('all_aJK4.L.X_sequences.txt')
glines = g.readlines()[0:47];
barcodetable = {}
for l in glines:
	atoms = l.split()
	z = int(atoms[0][-2:])
	barcode = atoms[1][19:26]
	barcodetable[barcode] = z

# Dictate which zs correspond to which experiments
experimentcodes = { '16.1':range(1,11), '16.2':range(11,21), '16.4':range(21,31), '18.2.A':range(31,36), '18.2.B':range(36,41), '18.2.E':range(41,46), 'wt1':[46], 'wt2':[47]};
experiments = experimentcodes.keys()

# Extract sequences from raw data file
print('Loading raw data file...')
f = open('454Reads.fna', 'r')
lines = f.readlines()
f.close()
seqs = []
s = ''
print('Extracting reads from data file...')
k=0;
for l in lines:
	if '>' in l:
		k=k+1;
		if k%1000 == 0:
			print('On sequence ' + str(k))
		if len(s) > 1:
			seqs.append(s)
		s = ''
	else:
		s = s + l.strip()
		
# Get filtered data in sigma-z form
data = [] 
print('Filtering seqs...')
for l in seqs:
	b = l.find('AATTGTGAGC');
	a = l.find('AGCGCAACGC') + 10;
	barcode = l[0:7];
	if (b-a == 75) and (barcode in barcodetable.keys()):
		z = barcodetable[barcode]
		seq = l[a:b]
		if not ('N' in l[a:b]):
			data.append([z, seq])
			if not len(seq) == 75:
				print('LENGTH ERROR!')

# Write sigma-z data by experiment
print('Parsing seqs by experiment...')
for e in experiments:
	codes = experimentcodes[e];
	fname = '454Data_' + e + '.txt'
	print('Writing %s ...'%fname)
	h = open(fname, 'w')
	hlines = [str(d[0]).zfill(2) + '\t' + d[1] for d in data if d[0] in experimentcodes[e]]
	h.write('\n'.join(hlines) + '\n')
	
print('Done!')


