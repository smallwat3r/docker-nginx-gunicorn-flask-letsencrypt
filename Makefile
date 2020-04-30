include .env


.PHONY: dc-start
dc-start:
	@docker-compose stop;
	@docker-compose build;
	@docker-compose up -d;

.PHONY: dc-stop
dc-stop:
	@docker-compose stop;

.PHONY: dc-start-local
dc-start-local:
	@docker-compose stop;
	@docker-compose build;
	@docker-compose up --scale nginx=0;
