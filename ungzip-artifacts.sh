#!/bin/bash

ls /tmp/artifacts | while read line; do
	gitsha=$(echo $line | sed 's/.tar.gz//')
	outdir=/root/.julia/artifacts/${gitsha}
	mkdir -p $outdir
	echo ">>> Extracting artifact $gitsha"
	tar xzf /tmp/artifacts/${line} -C $outdir
done
	
