HYDE?="hyde.py"

generate:
	${HYDE} -g -s .

serve: generate
	${HYDE} -w -k -s .

