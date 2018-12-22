dc-start:
	@docker-compose stop;
	@docker-compose build;
	@docker-compose up -d;

dc-stop:
	@docker-compose stop

