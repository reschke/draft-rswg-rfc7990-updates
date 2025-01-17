all: draft-rswg-rfc7990-updates.txt draft-rswg-rfc7990-updates.html

.PRECIOUS: %.xml

%.txt: %.xml
	xml2rfc $< --text

%.html: %.xml
	xml2rfc $< --html

%.xml: %.mkd
	kramdown-rfc $< >$@.new 2>/tmp/kram-errors.txt
	grep --regexp=Ignoring --invert-match /tmp/kram-errors.txt || true
	mv $@.new $@
