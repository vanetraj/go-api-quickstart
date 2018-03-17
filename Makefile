include .env
# make action arguments
CMD=$(filter-out $@,$(MAKECMDGOALS))

build:
	# docker build -t $(PROJECT_NAME) --target release .
	docker-compose build --force-rm  api_release

run:
	# docker run $(PROJECT_NAME)
	docker-compose run api_release

dev.up:
	docker-compose up api

dev.run:
	docker-compose run --rm api $(CMD)

dev.add.pkg:
	docker-compose run --rm api dep ensure -add $(CMD)