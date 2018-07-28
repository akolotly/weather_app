app-start:
	docker-compose up web

app-bash:
	docker-compose run --rm web bash

app-build:
	docker-compose build

app-console:
	docker-compose run --rm web rails c

