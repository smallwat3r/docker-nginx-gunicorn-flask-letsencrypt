include .env


.PHONY: install-le-client
install-le-client:
	sudo sh scripts/letsencrypt_install.sh ${SSL_EMAIL} ${NGX_DOMAIN};

.PHONY: renew-le-cert
renew-le-cert:
	sudo sh scripts/letsencrypt_renew.sh ${SSL_EMAIL} ${NGX_DOMAIN};

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
