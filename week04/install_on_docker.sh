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
docker run --name med263_bansal -v $(PWD):/workspace -ti ubuntu /bin/bash


###---------------------------------------------------------------------------
### RUN INSIDE DOCKER CONTAINER
###---------------------------------------------------------------------------
# install python3
apt-get update
apt-get install -y software-properties-common gcc 
add-apt-repository -y ppa:deadsnakes/ppa
apt-get update
apt-get install -y python3.8 python3-distutils python3-pip python3-apt
python3 --version

# install python3 packages
pip install numpy
pip install scipy

# install git
apt-get install -y git

# install tabix
apt-get install  -y tabix

# change the working directory to /workspace
cd /workspace

# download the tutorial code
git clone -b 2022 https://github.com/vibansal/med263.git

# follow the instruction on week4 practical at
#   https://github.com/vibansal/med263/blob/2022/practical_week4.md 