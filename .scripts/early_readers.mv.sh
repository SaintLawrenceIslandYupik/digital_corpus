#!/usr/bin/env bash

IFS=$'\n'

for line in $(cat early_readers.tsv) ; do

    IFS=$'\t '
    
    parts=($(echo ${line}))

    number=${parts[0]}
    name=${parts[1]}

    for lang in ess eng ; do
    
	for suffix in ${lang}_content ${lang}_titlepage ; do

	    source_file="${lang}/unleveled_readers/${suffix}/${name}.${suffix}"

	    destination_dir="${lang}/early_readers/${suffix}"

	    mkdir -p "${destination_dir}"
	    
	    destination="${destination_dir}/${number}_${name}.${suffix}"
	
	    if [ -f ${source_file} ]; then

	        git mv ${source_file} ${destination}
	    
	    fi
	     
	done

    done
    
done
