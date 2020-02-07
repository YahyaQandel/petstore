SHELL := /bin/sh
test:
	docker-compose run --rm -T django python manage.py test
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