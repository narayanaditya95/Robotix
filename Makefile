.PHONY: clean-pyc clean-build

help:
	@echo "clean-build - remove build artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "lint - check style with flake8"
	@echo "pep8 - check for PEP8 errors"
	@echo "test - run tests quickly with the default Python"
	@echo "database - import SQL file to local database"
	@echo "dump - rebuild SQL file from local database"
	@echo "coverage - check code coverage quickly with the default Python"

clean: clean-build clean-pyc

clean-build:
	rm -fr build/
	rm -fr dist/
	rm -fr *.egg-info

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

lint:
	flake8 Robotix

pep8:
	pep8 Robotix

test:
	python manage.py test

coverage:
	coverage run manage.py test
	coverage report -m

database:
	sudo -u postgres psql robotix < database.sql

dump:
	rm -f database.sql
	sudo -u postgres pg_dump robotix > database.sql
