# Tutorial: Conda, Jupyter, Python & R

## Background on Conda and Jupyter
<img width="276" alt="image" src="https://user-images.githubusercontent.com/25289269/148433697-8022274b-3bac-4947-a2b6-89b03854b70f.png">

### Conda
#### What is Conda?
- Conda is an open source package management system and environment management system that runs on Windows, macOS and Linux.
#### Why use Conda?
- Often used in bioinformatic workflows & by bioinformatic scientists
- Allows for multiple package versions depending on the project (environment) you are working on
- Lots of packages already avalible for quick and easy download

<img width="276" alt="image" src="https://user-images.githubusercontent.com/25289269/148433559-a6abfccb-fc78-4a43-b5c4-ad09951ce33f.png">. 

### Jupyter Labs
#### What is Jupyter Labs?
- A web based notebook that allows for both writting and execution of code 
- Can run notebooks in both Python and R
#### Why use Jupyter Labs?
- Often used in bioinformatic workflows & by bioinformatic scientists
- Great for testing code with immediate feedback
- User friendly and reliable 

## Conda

### Install Conda
In order to save time, we will be installing Miniconda (the mini version) instead of Anaconda (the full version).

1. Download Miniconda
   - Go to the webpage: (https://docs.conda.io/en/latest/miniconda.html#installing)
   - If you you have a Mac choose **Miniconda3 MacOSX 64-bit bash**
   - Save the miniconda download in your **Downloads** folder
2. Install Miniconda  
   - Start by opening up a terminal, then copy the commands below
```bash
cd Downloads
bash Miniconda3-latest-MacOSX-x86_64.sh
```
3. Test to ensure Miniconda was installed correctly
```bash
source $HOME/miniconda3/bin/activate
conda --help
```
4. Add Conda to your PATH
```bash
printf '\n# add path to conda\nexport PATH="$HOME/miniconda3/bin:$PATH"\n' >> ~/.bashrc
```
5. **Close and re-open** your terminal for the environmental variable changes to take effect

6. Initialize your conda environment
```bash
conda init --help
```
7. **Close and re-open** your terminal for the environmental variable changes to take effect

### Create Conda Environment
```bash
conda create -n 'med263_jupyter'
```
- If this step doesn't work, try running *conda activate* first

### Activate Conda Environment
```bash
conda activate med263_jupyter
```
- To check your conda environment is working, you should see *(med263_jupyter)* on the left part of your terminal now

## Install and Run Jupyter Labs
Now, that we have conda installed we can simply install jupyter labs. 
Before starting this step, make sure you are in the *(med263_jupyter)*  conda environment. If you are not, follow the instructions in the **Activate Conda Environment** step above to do so. 

### Install Jupyter Labs
```bash
conda install -c conda-forge jupyterlab
```

### Start a Jupyter Lab
```bash
jupyter lab
```
- If this step isn't working, make sure you are in the *(med263_jupyter)* conda environment

### Install R
- Go to (https://cloud.r-project.org) and install R and RStudio
   - Choose and download the correct operating system 

### Install R on Jupyter Labs  
1. Start by opening a terminal, then run the following
```bash
conda activate med263_jupyter
R
.libPaths()
```
   - This should output a **path** name ex. 'user/lib/R', copy this **path** for the next step
2. After copying the **path**, countine:
```bash
install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'), lib='path')
devtools::install_github('IRkernel/IRkernel')
IRkernel::installspec()
quit()
```
   - Make sure you change **path** to your copied path name above
3. Finally, check you installed everything correctly.
If the above steps were done right, you should now have the option of Python or R when starting Jupyter Notebooks.
```bash
jupyter lab
```
Your dashboard should look like the following:
<img width="276" alt="image" src="https://user-images.githubusercontent.com/25289269/148433362-b9446f17-7131-40d3-b7d5-2a5976d092d4.png">

## Intro to Python

### Basic Commands
1. Printing
```python
print("Hello World!")
```
2. Comments
 ```python
#This is a single line comment
'''
This is a 
multi-line
comment
'''
```
3. Basic For Loops  
In python, the tabs / spacing are necessary for the code to run properly
 ```python
sample_list = [1,2,3,4]
for items in sample_list:
   print(items)
```
Should print the following:
 ```python
> 1
> 2
> 3
> 4
```

4. Basic While Loop
 ```python
x = 0
while x < 5:
   x+=1
print(x)
```
Should print the following:
 ```python
> 5
```

## Intro to R

### Basic Commands
1. Printing
```R
x <- 'Hello World'
print(x)
```
Should print the following
```R
'Hello World'
```

2. Comments
 ```R
#This is a single line comment
```
3. Basic For Loops  
In python, the tabs / spacing are necessary for the code to run properly
 ```R
sample_list <- c(1, 2, 3, 4)
for (x in sample_list){
    print(x)
}
```
Should print the following:
 ```r
> 1
> 2
> 3
> 4
```

4. Basic While Loop
 ```R
i <- 1
while (i < 5) {
    i <- i + 1
}
print(i)
```
Should print the following:
 ```R
> 5
```
5. Basic Graphing
 ```R
y <- c(1, 2, 3, 4)
plot(y)
```
<img width="431" alt="image" src="https://user-images.githubusercontent.com/25289269/148433202-551dd179-862b-459a-95f8-3f79e381416e.png">

## Cheat Sheets
### Conda
[conda-cheatsheet.pdf](https://github.com/yosoykit/MED263-private/files/7824027/conda-cheatsheet.pdf)

### Python
[python-cheatsheet.pdf](https://github.com/yosoykit/MED263-private/files/7824039/python-cheatsheet.pdf)

### R
[base-r-cheatsheet.pdf](https://github.com/yosoykit/MED263-private/files/7824040/base-r-cheatsheet.pdf)

## References & Additional Help
Installing Conda: (https://docs.anaconda.com/anaconda/install/linux/)  
Install R in Jupyter: (https://www.datacamp.com/community/blog/jupyter-notebook-r), (https://github.com/jihoonkim/MED263/blob/master/provision/install_Jupyter.sh)

