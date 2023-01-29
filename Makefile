setup:
        cp -n .env.example .env || true
        docker-compose up -d


dump-tunnels:
	@rm -rf ./tunnels/*
	@find ./config -type d -name "peer_*" -print0 | xargs -0 -I {} -n1 cp -r {} ./tunnels/
	@find ./tunnels -type d -name "peer_*" -print0 | xargs -0 -I {} -n1 zip -r -j {}.zip {}
	@find ./tunnels -type d -name "peer_*"  -print0 | xargs -0 rm -rf


update-peers:
	cp -n .env.example .env || true
	docker-compose up -d --force-recreate
	@sleep 2
	docker-compose logs --tail=1000 wireguard
	$(MAKE) dump-tunnels
