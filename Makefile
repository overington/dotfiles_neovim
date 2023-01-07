venv-create: venv/bin/activate
	python -m venv venv
	source venv/bin/activate && \
		pip install -U pip; \

venv-update: venv-create requirements.txt
	echo "updating requirements"
	source venv/bin/activate && \
		pip install -U -r requirements.txt

install: venv-update


# vim:ft=make
#
