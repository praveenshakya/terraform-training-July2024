echo "beginning the execution of ansible installer"
sudo apt-get update
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-setuptools python-dev libffi-dev libssl-dev
git sshpass tree
sudo easy_install pip
sudo apt install ansible -y
