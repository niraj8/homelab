.PHONY: up
up: 
	docker compose up -d --build --remove-orphans
