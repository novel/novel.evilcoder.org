HYDE?=	hyde
TIDY?=	tidy -qe
FIND?=	find
ADDRESS?=	127.0.0.1

clean:
	rm -fr deploy

generate: clean
	${HYDE} -s . gen

validate: generate
	@for html in `${FIND} deploy -name "*.html"|xargs`; do \
		echo "validating $${html}"; \
		${TIDY} $${html}; \
	done

serve: generate
	${HYDE} -s . serve -a ${ADDRESS}

upload: generate
	./upload.sh
