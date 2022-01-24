###---------------------------------------------------------------------------
### RUN FROM THE HOST COMPUTER
###---------------------------------------------------------------------------

# display the current working directory
pwd


# start a docker container with a name med263_bansal
#   attaching the current host directory '$(PWD)' with 
#   '/workspace' directory  inside the container
#
# 1) You can set your own host directory in place of $(PWD)
#    For example,  -v /users/JohnDoe:/workspace
# 2) you can give your own name for the docker in place of med263_bansal
#    For example,  --name med263_week4
docker run --name med263_bansal -v $(PWD):/workspace -ti scipy/scipy-dev /bin/bash


###---------------------------------------------------------------------------
### RUN INSIDE DOCKER CONTAINER
###---------------------------------------------------------------------------
# switch user from 'gitpod' to 'root'
#   as 'root' user can install linux packages
#   and 'gitpod' user will run installed packages and tools
sudo -i -u root

# check if the current user is 'gitpod' or 'root'
whoami

# update linux packages
apt-get update

# install tabix
apt-get install  -y tabix

# swith user back to 'gitpod' from 'root'
exit

# check if the current user is 'gitpod' or 'root'
whoami

# change the working directory to /workspace
cd /workspace

# download the tutorial code
git clone -b 2022 https://github.com/vibansal/med263.git

# follow the instruction on week4 practical at
#   https://github.com/vibansal/med263/blob/2022/practical_week4.md 