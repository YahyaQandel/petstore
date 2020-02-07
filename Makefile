SHELL := /bin/sh
DJANGO_TEST_SETTINGS_MODULE = $(PROJECT).settings.$(TEST_SETTINGS)
test:
	python3 manage.py test
start:
	python3 manage.py runserver