all: ess.character_histogram

%.character_histogram:
	find $* -name "*.*" -type "f" | grep -v ".DS_Store" | xargs cat | ruby -e "STDIN.each_line{|line| line.strip().split('').each{|char| puts char } }" | sort | uniq -c > $@

clean:
	rm -f *.character_histogram
