HYDE?=	hyde.py
TIDY?=	tidy -qe
FIND?=	find
ADDRESS?=	127.0.0.1

clean:
	rm -fr deploy

generate: clean
	${HYDE} -g -s .

validate: generate
	@for html in `${FIND} deploy -name "*.html"|xargs`; do \
		echo "validating $${html}"; \
		${TIDY} $${html}; \
	done

serve: generate
	${HYDE} -a ${ADDRESS} -w -k -s .

upload: generate
	./upload.sh
