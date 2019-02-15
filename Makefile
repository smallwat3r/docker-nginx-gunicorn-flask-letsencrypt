include .env


install-le-client:
	sudo sh scripts/letsencrypt_install.sh ${SSL_EMAIL} ${NGX_DOMAIN};

renew-le-cert:
	sudo sh scripts/letsencrypt_renew.sh ${SSL_EMAIL} ${NGX_DOMAIN};

dc-start:
	@docker-compose stop;
	@docker-compose build;
	@docker-compose up -d;

dc-stop:
	@docker-compose stop;

dc-cleanup:
	@docker rm $(shell docker ps -qa --no-trunc --filter "status=exited");
	@docker rmi $(shell docker images --filter "dangling=true" -q --no-trunc);
