all: ess.character_histogram

%.character_histogram:
	find $* -name "*.*" -type "f" | grep -v ".DS_Store" | xargs cat | ruby -e "STDIN.each_line{|line| line.strip().split('').each{|char| puts char } }" | sort | uniq -c > $@

readers.stats:
	find ess/level* ess/gambell_mdc -name "*.ess_content" -type "f" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	find ess/level* ess/gambell_mdc -name "*.ess_titlepage" -type "f" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw

readers.types:
	find ess/level* ess/gambell_mdc -name "*.ess_content" -type "f" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	find ess/level* ess/gambell_mdc -name "*.ess_titlepage" -type "f" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l

jacobson.stats:
	find ess/jacobson_eoc -name "*.ess_content" -type "f" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw

jacobson.types:
	find ess/jacobson_eoc -name "*.ess_content" -type "f" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l

oral.stats:
	find ess/sivuqam_volume* ess/nagai ess/ungipaghaghlanga -name "*.ess_content" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw
	find ess/sivuqam_volume* ess/nagai ess/ungipaghaghlanga -name "*.ess_titlepage" | grep -v ".DS_Store" | xargs cat | grep -v "^\s*$$" | wc -lw

oral.types:
	find ess/sivuqam_volume* ess/nagai ess/ungipaghaghlanga -name "*.ess_content" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l
	find ess/sivuqam_volume* ess/nagai ess/ungipaghaghlanga -name "*.ess_titlepage" | grep -v ".DS_Store" | xargs cat | tr ' ' '\n' | grep -v "^\s*$$" | sort | uniq | wc -l



clean:
	rm -f *.character_histogram
