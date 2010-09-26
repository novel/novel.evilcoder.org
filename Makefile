HYDE?="hyde.py"

clean:
	rm -fr deploy

generate:
	${HYDE} -g -s .

serve: clean generate
	${HYDE} -w -k -s .

