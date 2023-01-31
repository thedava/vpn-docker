DC = docker-compose

setup:
	cp -n .env.example .env || true
	$(DC) up -d


dump-tunnels:
	@rm -rf ./tunnels/*
	@find ./config -type d -name "peer_*" -print0 | xargs -0 -I {} -n1 cp -r {} ./tunnels/
	@find ./tunnels -type d -name "peer_*" -print0 | xargs -0 -I {} -n1 zip -r -j {}.zip {}
	@find ./tunnels -type d -name "peer_*"  -print0 | xargs -0 rm -rf

logs:
	$(DC) logs --tail=1000 wireguard


update-peers:
	cp -n .env.example .env || true
	$(DC) up -d --force-recreate
	@sleep 4
	$(MAKE) logs dump-tunnels


upgrade:
	docker pull lscr.io/linuxserver/wireguard:latest
	$(DC) up -d
