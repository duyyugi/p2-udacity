# Create Python virtual environment
python3 -m venv ~/.myrepo

# active Python this virtual environment
source ~/.myrepo/bin/activate

# build project
make all

#deploy app using azure app service
az webapp up --name duyyugi2