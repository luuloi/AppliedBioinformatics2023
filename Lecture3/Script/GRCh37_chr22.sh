# Total length of whole chr22
zcat chr22.fa.gz | awk ' (NR>1){total_length+=length($0)}; END{print total_length}'

# Find gene "SOX2"
zcat gencode.v43lift37.annotation.gtf.gz | grep '"SOX2"'

# Find gene "POU5F1"
zcat gencode.v43lift37.annotation.gtf.gz | grep '"POU5F1"' 

# Chr22 with only "gene" filter
zcat gencode.v43lift37.annotation.gtf.gz | grep -v "#" | grep "^chr22" | awk ' BEGIN{FS="\t"}; ($3=="gene"){print $0} '

# Count all genes in Chr22
zcat gencode.v43lift37.annotation.gtf.gz | grep -v "#" | grep "^chr22" | awk ' BEGIN{FS="\t"}; ($3=="gene"){print $0} ' | wc -l 

# Summary different kinds of gene types in Chr22
zcat gencode.v43lift37.annotation.gtf.gz | grep -v "#" | grep "^chr22" | awk ' BEGIN{FS="\t"}; ($3=="gene"){print $9} ' | cut -d";" -f 2 | sort | uniq -c
