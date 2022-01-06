# MED263 Tutorial: Docker, linux, and git


## Table of Contents
* Operating System
* Bioinformatics and Linux
* Docker
* Key benefit of Docker
* Image vs. Container
* Container vs. Virtual Machine (VM)
* Install Docker
* Windows users only: enable virtualization in BIOS
* Docker version
* Hello World Test
* iAdmix Test
* Ubuntu docker
* Basic linux commands
* git
* Variant prioritization with VCF-miner
* More docker commands
* References


## Operating System
An **operating system (OS)** is system software that manages computer hardware and software resources and provides common services for computer programs and it will enable users to interact with a computer system

Following are important functions of an OS
* device management
* file management
* job accounting
* memory managment
* processor management
* resource sharing
* scheduling
* security

|        | Layers of Software                  |
|--------|-------------------------------------|
| Top    | User-Written Scripts                |
|        | User Interface                      |
|        | Application                         |
|        | Run-time Library                    |
|        | Application Program Interface (API) |
|        | **Operating System**                |
|        | Device Drivers                      |
|        | Basic Input Output System (BIOS)    |
| Bottom | Hardware                            |



**EXERCISE 1**: What kind of OS (and web browser) are you using?
Find it from [WhatIsMyBrowser](https://www.whatismybrowser.com)


**EXERCISE 2**: What is the market share of linux in the Desktop platform?
Find it out from @[StatCounter](http://gs.statcounter.com/os-market-share/desktop/worldwide/#monthly-202012-202112-bar)


## Bioinformatics and Linux
* Bioinformatics relies heavily on Linux-based computers (hardware) and software.
* Although many bioinformatics software tools are compiled on Mac OS and Windows,
it is more conveneint to install and run the software executables on a Linux system.



## Docker
Docker is a tool that allows developers, sys-admins etc. to easily deploy their applications in a sandbox (called containers) to run on the host operating system i.e. Linux.


## Key benefit of Docker
* The key benefit of Docker is that it allows users to package an application with all of its dependencies into a standardized unit for software development.
* Unlike virtual machines, containers do not have the high overhead and hence enable more efficient usage of the underlying system and resources.


From Dockerfile to image to container

![Dockerfile](https://kaust-vislab.github.io/introduction-to-docker-for-data-scientists/fig/dockerfile-image-container-relationship.jpg)
[source: kaust-vislab.github.io](https://kaust-vislab.github.io/introduction-to-docker-for-data-scientists/01-introduction-to-docker/index.html)


## Image vs. Container
* An **image** is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files.

* A **container** is a runtime instance of an image—what the image becomes in memory when actually executed. It runs completely isolated from the host environment by default, only accessing host files and ports if configured to do so.


## Container vs. Virtual Machine (VM)
![VMdiagram](https://www.docker.com/sites/default/files/d8/2018-11/container-vm-whatcontainer_2.png)
[source: docker.com](https://www.docker.com/sites/default/files/d8/2018-11/container-vm-whatcontainer_2.png)
* Virtual machines run guest operating systems—note the OS layer in each box.
* This is resource intensive, and the resulting disk image and application state is an entanglement of OS settings, system-installed dependencies, OS security patches, and other easy-to-lose, hard-to-replicate ephemera.



Container diagram
![CONTAINERdiagram](https://www.docker.com/sites/default/files/d8/2018-11/docker-containerized-appliction-blue-border_2.png)
[source: docker.com](https://www.docker.com/sites/default/files/d8/2018-11/docker-containerized-appliction-blue-border_2.png)
* Containers can share a single kernel, and the only information that needs to be in a container image is the executable and its package dependencies, which never need to be installed on the host system.
* These processes run like native processes, and you can manage them individually by running commands like ``docker ps``—just like you would run ps on Linux to see active processes.
* Finally, because they contain all their dependencies, there is no configuration entanglement; a containerized app “runs anywhere.”


## Install Docker
Docker Community Edition (CE) for your operating system
[Download and install Docker](https://store.docker.com/search?offering=community&q=&type=edition)


## Windows users only: enable virtualization in BIOS
When prompted, ensure the Enable Hyper-V Windows Features or the Install required Windows components for WSL 2 option is selected on the Configuration page.
[More details for Windows users](https://docs.docker.com/desktop/windows/install/)


## Docker version
**EXERCISE 3**: What is the Docker version installed in your computer?
Do you have the most recent version? Find it by running 
```bash
# from the host machine
docker --version
```
in the terminal or Power Shell




## Hello World Test
1. Click **Docker Quickstart** icon to start Docker
2. Open a terminal and type
3. Open a terminal and type the following command
```bash
# from the host machine
docker run hello-world
```
4. Docker installation is success if you see the outputs like the one below
```
Hello from Docker!
This message shows that your installation appears to be working correctly
To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
```


## iAdmix Test
Given the called variant file (vcf), we want to estimate the ancestry of this individual by the list proportions of multiple reference populations that sums up to 1.
```bash
# from the host machine
docker run -ti j5kim/iadmix:latest /bin/bash /testrun/testrun.sh
```

**EXERCISE 4**: What is the ancestry of this individual? Report the estimated admixture proportions.
Consult the [HapMap3](http://www.sanger.ac.uk/resources/downloads/human/hapmap3.html) to spell out the population acronyms.

Source: Bansal et al. BMC Bioinfo 2015
Fast individual ancestry inference from DNA sequence data leveraging allele frequencies for multiple populations. [PMID: 25592880](https://www.ncbi.nlm.nih.gov/pubmed/25592880)

## Ubuntu docker
Start running a ubuntu docker
```bash
# from the host machine
docker run -ti ubuntu
```

Exit from the running docker instance
```sh
# inside the docker instance
exit
```



**EXERCISE 5**: What is the version of Ubuntu? What is its codename?
Find it out from the docker terminal by running ```cat /etc/lsb-release```

List all the docker insances
```bash
# from the host computer
docker ps -a
```

Start the stopped docker
```bash
docker start <CONTAINER_NAME>
```

List the running docker instances
```bash
docker ps
```

Attach to the running docker instance
```bash
docker exec -it <CONTAINER_NAME> /bin/bash
```



## Basic linux commands
1. Update the Ubuntu packages
```sh
# inside the docker instance
apt-get update
```

2. Display the current directory
```sh
# inside the docker instance
pwd
```

3. Change to a different directory and check if the current directory has been changed
```sh
# inside the docker instance
cd /home
pwd
```

4. Try downloading an external file
```sh
# inside the docker instance
wget https://github.com/jihoonkim/dockerhub-iadmix/raw/master/HG001_chr22.vcf.gz
```

5. Install missing package **wget** first and try again downloading the file
```sh
# inside the docker instance
apt-get install wget
wget https://github.com/jihoonkim/dockerhub-iadmix/raw/master/HG001_chr22.vcf.gz
```
**EXERCISE 6**: What is the file size of downloaded file HG001_chr22.vcf.gz?
Find it out from the docker terminal by running ```ls -hl```

6. Try extracting the compressed file in .gz format while keeping the original file
```sh
# inside the docker instance
gunzip -k HG001_chr22.vcf.gz
```

7. Install missing package **zip** first and try again extracting the file
```sh
# inside the docker instance
apt-get install zip
gunzip -k HG001_chr22.vcf.gz
ls -hl
```
**EXERCISE**: What is the compression ratio of gz with the file HG001_chr22.vcf?
Find it out from the docker terminal by running ```ls -hl```

8. Print the last ten lines of the .vcf file
```sh
# inside the docker instance
tail -n 10 HG001_chr22.vcf
```
**EXERCISE 7**: What is the the number of lines in .vcf file HG001_chr22.vcf?
Find it out from the docker terminal by running ```wc -l HG001_chr22.vcf```
**EXERCISE 8**: What is the the md5 value of the last ten lines of the file HG001_chr22.vcf?
Find it out from the docker terminal by running ```tail -n 10 HG001_chr22.vcf | md5sum ```

9. Search the line containing the SNP with RSID rs2401506.
```sh
# inside the docker instance
grep rs2401506 HG001_chr22.vcf
```


10. Create your own directory
```sh
# inside the docker instance
mkdir variants
ls -hl
```

11. Copy a file
```sh
# inside the docker instance
cp HG001_chr22.vcf testcopy.vcf
ls -hl
```

12. Move a file to another directory
```sh
# inside the docker instance
mv testcopy.vcf variants
ls -hl
ls -hl variants
```

13. Install VIM editor and start using it
```sh
# inside the docker instance
apt-get install vim
vim myfile.txt
```

**EXERCISE 9**: What are the reference allels and alternative alleles of SNP rs2401506 in this .vcf file? Find it out from the docker terminal by running ```tail -n 10 HG001_chr22.vcf | md5sum ```


**EXERCISE 10**: Read and follow the [Interactive VIM tutorial](http://www.openvim.com/tutorial.html).  We will cover the earlier part during the class, but be sure to finish the rest at home by next class.


## Git

The lifecycle of a file in git.
![file status](https://uidaholib.github.io/get-git/images/workflow.png)
[source: uidaholib.github.io](https://uidaholib.github.io/get-git/images/workflow.png)


Update apt-get
```sh
apt-get update
```

Install git
```sh
apt-get install git
```

retrieve an entire repository from a hosted location via URL
```sh
git clone https://github.com/jihoonkim/test.git
```

show modified files in working directory, staged for your next commit
```sh
git status
```

add a file as it looks now to your next commit (stage)
```sh
git add test.txt
```

commit your staged content as a new commit snapshot
```sh
git commit -m "fixed dividing by zero error"
```

Transmit local branch commits to the remote repository branch
```sh
git push
```

Exit docker instance to return to Host computer
```sh
exit
```


## Web application on Docker (use case: VCF-miner)
1. Start running vcf-miner docker
```bash
# from the host computer
docker run -d -p 8888:8080 stevenhart/vcf-miner
```

2. Open a browser to http://localhost:8888/vcf-miner/
```
Username: Admin
Password: temppass
```

3. Download an example vcf file, [NA12818](https://github.com/raonyguimaraes/mendelmd/raw/master/examples/annotation.final.vcf.zip)
from Mayo Clinic, and import it into the VCF-miner

4. Import the downloaded vcf file into vcf-miner
Hart et al. Brief Bioinform. 2016 [PMID 26210358](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4793895)

5. Analyze and apply filters (dbNSFP_MutationAssessor_pred = H).


## R Docker
```bash
# from the host computer
docker run --rm -p 8787:8787 -e PASSWORD=rstudio rocker/rstudio
```
In a browser, type
```bash
http://localhost:8787
```

## More docker commands
Show running containers
```bash
# from the host computer
docker ps
```

Stop running containers
```bash
# from the host computer
docker stop
```

Show all containers
```bash
# from the host computer
docker ps -a
```

Show all docker images
```bash
# from the host computer
docker images
```




## References
https://docs.docker.com/get-started/
https://docker-curriculum.com/
