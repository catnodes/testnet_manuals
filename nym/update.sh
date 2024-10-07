node_id=$(systemctl cat nym-mixnode | grep id | awk '{print $4}' | sed 's/.$//' | sed 's/^.//')
version=$(nym-node --version | grep "Build Version" | awk '{print $3}')
sleep 1
echo "You are running mixnode version" $version "with id" $node_id
sleep 1
sudo systemctl stop nym-mixnode
echo "Downloading new binaries (nym-binaries-v2024.9-topdeck)"
sudo wget -O $(which nym-node) https://github.com/nymtech/nym/releases/download/nym-binaries-v2024.9-topdeck/nym-node
version=$(nym-node --version | grep "Build Version" | awk '{print $3}')
echo "Current mixnode version:" $version
echo "Upgrading your mixnode config"
sudo systemctl restart nym-mixnode
echo "Upgrade complete!"
