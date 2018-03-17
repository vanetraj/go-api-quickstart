include .env

build:
	# docker build -t $(PROJECT_NAME) --target release .
	docker-compose build --force-rm  api_release

run:
	# docker run $(PROJECT_NAME)
	docker-compose run api_release