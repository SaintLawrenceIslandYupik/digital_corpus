all: ess.character_histogram

%.character_histogram:
	find $* -name "*.*" -type "f" | xargs cat | ruby -e "STDIN.each_line{|line| line.strip().split('').each{|char| puts char } }" | sort | uniq -c > $@
