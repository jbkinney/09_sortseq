# 1. Extract sequences labled '11'; these correspond to crp-wt B0
# 2. Isolate the sequence field
# 3. Sort sequences then count occurances of each unique sequence.
# 4. Arrange sequences in descending order
cat 454Data_16.2.txt | grep 11 | cut -f 2 | sort | uniq -c | sort -r \
	> library.txt

# Extract region around CRP binding site, for display purposes
head -n 10 library.txt | cut -c 1-35 | sed 's/$/.../' > fig_3A.txt