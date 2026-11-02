export LC_ALL=C.UTF-8

all: likelyNames.txt
	tail $<

likelyForeign.txt: tokens.txt
	cat $^ | sort | uniq | grep "-" > $@

english.txt: likelyForeign.txt
	cat $^ | grep -v [0-9] | grep '-' | grep -v 'ii-i$$' | grep -v '[Aa]a-a$$' | grep -v 'uu-u$$'  | grep -v "elpaa" |  uniq | sed 's,-.*,,' | sort | uniq > $@

likelyNames.txt: english.txt
	cat $^ | grep [A-Z] | grep -v "Aa"> $@


numbers.txt: tokens.txt
	cat $^ | grep [0-9] | sed 's,-.*,,' > $@

likelyForeign.tsv: likelyForeign.txt
	cat $^ | sed 's,-.*,,' | sort --ignore-case -r | uniq --ignore-case -c | sort -g | sed 's, *\([[:digit:]]\+\) \(.*\) *,\1\t\2,' > $@

zipf.txt: tokens.tsv
	@cat $^ | cut -f 1 > $@
	
zipf.count: zipf.txt
	@wc -l $^ | cut -d " " -f 1 | tr -d "\n" > $@

zipf.ranks: zipf.count
	@seq $(shell cat zipf.count) -1 1 > $@

zipf.tsv: zipf.ranks zipf.txt
	paste $^ | sort -g > $@

%.tsv: %.txt
	@cat $^ | sort --ignore-case -r | uniq --ignore-case -c | sort -g | sed 's, *\([[:digit:]]\+\) \(.*\) *,\1\t\2,' > $@


tokens.txt: $(wildcard ../../ess/new_testament/*)
	@cat $^ | tr ' ' '\n' > $@
	

clean:
	rm -f names.* tokens.* zipf.* dash.* numbers.* likelyForeign.txt

.PHONY: all