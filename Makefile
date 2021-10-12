yupik:   readers.ess.stats readers.ess.types oral.ess.stats oral.ess.types jacobson.ess.stats jacobson.ess.types bible.ess.stats bible.ess.types
english: readers.eng.stats readers.eng.types oral.eng.stats oral.eng.types jacobson.eng.stats jacobson.eng.types bible.eng.stats bible.eng.types

%.character_histogram:
	find $* -name "*.*" -type "f" | grep -v ".DS_Store" | xargs cat | ruby -e "STDIN.each_line{|line| line.strip().split('').each{|char| puts char } }" | sort | uniq -c > $@

readers.%.stats:
	@echo 'Elementary readers ($*: sentences & tokens)'
	@find $*/level* $*/unleveled_readers -name "*.$*_content" -type "f" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	@echo
	@echo 'Elementary readers front-matter ($*: sentences & tokens)'
	@find $*/level* $*/unleveled_readers -name "*.$*_titlepage" -type "f" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	@echo

readers.%.types:
	@echo 'Elementary readers ($*: types)'
	@find $*/level* $*/unleveled_readers -name "*.$*_content" -type "f" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	@echo
	@echo 'Elementary readers front-matter ($*: types)'
	@find $*/level* $*/unleveled_readers -name "*.$*_titlepage" -type "f" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	@echo

jacobson.%.stats:
	@echo 'Jacobson example sentences (sentences & tokens)'
	@find $*/jacobson_eoc -name "*.$*_content" -type "f" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	@echo

jacobson.%.types:
	@echo 'Jacobson example sentences (types)'
	@find $*/jacobson_eoc -name "*.$*_content" -type "f" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	@echo

oral.%.stats:
	@echo 'Oral narratives (sentences & tokens)'
	@find $*/sivuqam_volume* $*/nagai $*/ungipaghaghlanga -name "*.$*_content" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	@echo
	@echo 'Oral narratives front-matter (sentences & tokens)'
	@find $*/sivuqam_volume* $*/nagai $*/ungipaghaghlanga -name "*.$*_titlepage" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	@echo

oral.%.types:
	@echo 'Oral narratives (types)'
	@find $*/sivuqam_volume* $*/nagai $*/ungipaghaghlanga -name "*.$*_content" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	@echo
	@echo 'Oral narratives front-matter (types)'
	@find $*/sivuqam_volume* $*/nagai $*/ungipaghaghlanga -name "*.$*_titlepage" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	@echo


bible.%.stats:
	@echo 'Yupik New Testament (sentences & tokens)'
	@find $*/new_testament -name "*.$*" -type "f" | grep -v ".DS_Store" | xargs cat | tr -d '§' | grep -v "^\s*$$" | wc -lw
	@echo

bible.%.types:
	@echo 'Yupik New Testament (types)'
	@find $*/new_testament -name "*.$*" -type "f" | grep -v ".DS_Store" | xargs cat | tr -d '§' | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	@echo


all.%.train:
	@echo "Elementary readers, Lore of St. Lawrence Island, and Ungipaghaghlanga as ${*} training data"
	@cat $(wildcard ${*}/level1.kallagneghet/${*}_*/*.${*}_*)      | grep -v "^\s*$$"  > $@
	@cat $(wildcard ${*}/level2.akiingqwaghneghet/${*}_*/*.${*}_*) | grep -v "^\s*$$" >> $@
	@cat $(wildcard ${*}/level3.suluwet/${*}_*/*.${*}_*)           | grep -v "^\s*$$" >> $@
	@cat $(wildcard ${*}/sivuqam_volume1/${*}_*/*.${*}_*)          | grep -v "^\s*$$" >> $@
	@cat $(wildcard ${*}/sivuqam_volume2/${*}_*/*.${*}_*)          | grep -v "^\s*$$" >> $@
	@cat $(wildcard ${*}/sivuqam_volume3/${*}_*/*.${*}_*)          | grep -v "^\s*$$" >> $@
	@cat $(wildcard ${*}/ungipaghaghlanga/${*}_*/*.${*}_*)         | grep -v "^\s*$$" >> $@
	@echo


bible.%.train:
	@echo 'Yupik New Testament as training corpus (excludes Luke and John)'
	@find $*/new_testament -maxdepth 1 -type f | sort | grep -v 'B03_.*_Luke' | grep -v 'B04_.*_John' | xargs cat | tr -d '§' | sed 's,^ *,,' | grep -v "^\s*$$"  > $@
	@echo

bible.%.dev:
	@echo 'Yupik New Testament as dev corpus (includes only Luke)'
	@find $*/new_testament -maxdepth 1 -type f | sort | grep 'B03_.*_Luke' | xargs cat | tr -d '§' | sed 's,^ *,,' | grep -v "^\s*$$"  > $@
	@echo

bible.%.test:
	@echo 'Yupik New Testament as test corpus (includes only John)'
	@find $*/new_testament -maxdepth 1 -type f | sort | grep 'B04_.*_John' | xargs cat | tr -d '§' | sed 's,^ *,,' | grep -v "^\s*$$"  > $@
	@echo


clean:
	rm -f *.character_histogram *.train *.dev *.test
