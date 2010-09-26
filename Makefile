HYDE?="hyde.py"

clean:
	rm -fr deploy

generate: clean
	${HYDE} -g -s .

serve: generate
	${HYDE} -w -k -s .

upload: generate
	./upload.sh
