.PHONY: help start stop start-local build

help: ## Show this help menu
	@echo "Usage: make [TARGET ...]"
	@echo ""
	@grep --no-filename -E '^[a-zA-Z_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-15s %s\n", $$1, $$2}'

start: stop build ## Start docker
	@docker compose --env-file=certbot.env up -d

start-local: stop build ## Start docker for local dev (w/o nginx and certbot)
	@docker compose up --scale nginx=0

stop: ## Stop docker
	@docker compose stop

build: ## (re)build Docker images
	@docker compose --env-file=certbot.env build
