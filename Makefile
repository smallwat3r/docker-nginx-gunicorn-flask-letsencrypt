include .env

.PHONY: help dc-start dc-stop dc-start-local dc-build

help: ## Show this help menu
	@echo "Usage: make [TARGET ...]"
	@echo ""
	@grep --no-filename -E '^[a-zA-Z_%-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-15s %s\n", $$1, $$2}'

dc-stop: ## Stop docker (might need sudo)
	@docker-compose stop;

dc-start: dc-stop dc-build ## Start docker (might need sudo)
	@docker-compose up -d;

dc-start-local: dc-stop dc-build ## Start docker for local dev (w/o nginx)
	@docker-compose up --scale nginx=0;

dc-build:
	@docker-compose build;
