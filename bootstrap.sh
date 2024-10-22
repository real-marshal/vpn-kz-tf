export DEBIAN_FRONTEND=noninteractive

apt-get update -qq > /dev/null
apt-get install -y -qq curl > /dev/null

curl -sS https://get.docker.com/ | sh > /dev/null

bash -c "$(wget -qO- https://raw.githubusercontent.com/Jigsaw-Code/outline-server/master/src/server_manager/install_scripts/install_server.sh)" | sed -n 's/.*\({.*}\).*/\1/p' > outline_config

