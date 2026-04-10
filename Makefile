.PHONY: up
up:
	docker compose up -d --build --remove-orphans

.PHONY: cert
cert:
	tailscale cert --cert-file data/certs/$(TAILSCALE_HOST).crt \
	               --key-file data/certs/$(TAILSCALE_HOST).key \
	               $(TAILSCALE_HOST)
