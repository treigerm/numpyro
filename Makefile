all: test

lint: FORCE
	ruff .
	python scripts/update_headers.py --check

license: FORCE
	python scripts/update_headers.py

format: license FORCE
	ruff . --fix

install: FORCE
	pip install -e .[dev,doc,test,examples]

doctest: FORCE
	JAX_PLATFORM_NAME=cpu $(MAKE) -C docs doctest

test: lint FORCE
	pytest -v test

clean: FORCE
	git clean -dfx -e numpyro.egg-info

docs: FORCE
	$(MAKE) -C docs html

notebooks: FORCE
	$(MAKE) -C notebooks html

FORCE:
