#!/bin/bash
file=$1
filename="${file%.*}"
chunk_size=$2
header=$(head -1 $file)
tail -n +2 $file | split -d -l $chunk_size - ${filename}_part_ --verbose

for i in ${filename}_part_*; do
    echo -e "$header\n$(cat $i)" > $i
    mv $i $i.txt
done
