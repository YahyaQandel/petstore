SHELL := /bin/sh
test:
	docker-compose run --rm -T django python manage.py test  --noinput
start:
	docker-compose up
build:
	docker-compose build --no-cache
down:
	docker-compose down
prune:
	docker-compose down -v
logs:
	docker-compose logs -f django
bash:
	docker-compose exec  django bash
makemigrations:
	docker-compose run --rm -T django python manage.py makemigrations
migrate:
	docker-compose run --rm -T django python manage.py migrate