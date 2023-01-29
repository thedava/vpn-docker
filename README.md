# thedava/vpn-docker

A WireGuard based VPN server that runs in a docker container.

This is just a utility project with some basic configurations for the easy use of [linuxserver/docker-wireguard](https://github.com/linuxserver/docker-wireguard).


## Initial setup

Copy the .env.example file as .env file and adjust to your needs:
* SERVER contains the address to the server (either domain or IP)
* PEERS contains a comma separated list of peer configuration names (e.g. "admin,user1,user2")


## Create new peers

1. Update your `.env` file and add another user to the `PEERS=` var
2. Use `make update-peers` for recreating wireguard and creating the new peers (ATTENTION: This will cut all active connections)
3. Now you can find all known and configured peers in the `./tunnels` directory


## Connect to server

1. Download a suitable client from [wireguard.com](https://www.wireguard.com/install/)
2. Install and open client
3. Choose "Import tunnel from file" option and select the `peer_*.zip` file
4. Click "Activate"


# Sources

* https://github.com/linuxserver/docker-wireguard
