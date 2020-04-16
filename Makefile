include .env


.PHONY: dc-start
dc-start:
	@docker-compose stop;
	@docker-compose build;
	@docker-compose up -d;

.PHONY: dc-stop
dc-stop:
	@docker-compose stop;

.PHONY: dc-cleanup
dc-cleanup:
	@docker rm $(shell docker ps -qa --no-trunc --filter "status=exited");
	@docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc);

.PHONY: dc-reboot
dc-reboot:
	@docker-compose stop;
	printf 'y' | sudo docker system prune;
	@docker-compose build;
	@docker-compose up -d;
