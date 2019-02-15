dc-start:
	@docker-compose stop;
	@docker-compose build;
	@docker-compose up -d;

dc-stop:
	@docker-compose stop;

dc-cleanup:
	@docker rm $(shell docker ps -qa --no-trunc --filter "status=exited")
	@docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc)
