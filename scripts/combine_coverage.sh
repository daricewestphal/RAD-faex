#!/bin/bash

# ----------------------------------------------------------------------------------------
# --- Combine RADtag coverage from all individuals
# ----------------------------------------------------------------------------------------

for cov in `ls -v results/*.cov.bed | grep -v 'gt1'`; do
	cut -f 5 $cov > $cov.tmp
done;

cut -f 1-3 results/RADtags.bed > results/combined.cov.tmp

paste results/combined.cov.tmp \
	`ls -v results/*.cov.bed.tmp` \
	> results/RADtag.coverage.all.txt

rm results/*.cov.bed.tmp
rm results/combined.cov.tmp

exit
