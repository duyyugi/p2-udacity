# Overview

In this project, we will build an flask application that can predict house price of Boston or California. This project is applied Continuous Integration (CI) by using Github Actions and we use Azure App Service to deploy app to website and create a Azure Pipeline to apply changes automatically from code in github to web app so that we can apply Continuos Delivery (CD).

## Project Plan

* [Link to a Trello board for the project](https://trello.com/b/sachbUu9/p2-udacity)
* [Link to a spreadsheet that includes the original and final project plan](https://docs.google.com/spreadsheets/d/1VS6FavzHqJ2QgfqKAtlMbNunuqqQ5wceTRKVGWMbJgI/edit?usp=sharing)

## Instructions

## Architectural Diagram

![image](https://user-images.githubusercontent.com/35824913/209519200-e645e3e5-09ad-40bb-b229-aa78278479d9.png)


## Instructions for running this project

### Prerequisites:

* [Github account](https://github.com/)

* [Azure account](https://azure.microsoft.com/en-us/)

* [Azure devops account](https://dev.azure.com/f)

### Create a new fork of this project

* Create a new fork of this project so that you can work on it easily

![image](https://user-images.githubusercontent.com/35824913/209524110-d0a5882a-fd6b-474a-916f-ca0acf1d9931.png)

* Delete azure-pipelines.yml file (You will setup a new one)

### Create and configure ssh key to github account

* Go to Azure portal and create a new shell or bash command

* Create your ssh key and add to your github setting

```
ssh-keygen -t rsa
cat <your-keyfile-path>
```
* Go to [Github key setting](https://github.com/settings/keys) and add created key

### Clone project into Azure Cloud Shell

* Copy SSH path to clone your project into Azure Cloud Shell

![image](https://user-images.githubusercontent.com/35824913/209527012-240c94d8-5fc1-4ba2-aa25-5cac589e9fa6.png)

```
git clone <your-SSH-path>
```

### Configure github Actions to apply Continuous Integration (CI)

* Go to github Actions and enable workflow file

![image](https://user-images.githubusercontent.com/35824913/209563033-5acf9324-8404-4384-b6c4-222647bfdf34.png)

* Update app.py and commit to make sure that github Actions run properly

![image](https://user-images.githubusercontent.com/35824913/209563249-5f9f8058-0aaf-4e64-8d83-a833ac530e66.png)

### Create and active the python virtual environment and run project

* You need to create python virtual environment inside your project folder

```
python3 -m venv ~/.myrepo
source ~/.myrepo/bin/activate
```

* Run this project following to Makefile

```
make all
```
- After running this command, your bash/shell cmd should be like blow:

![image](https://user-images.githubusercontent.com/35824913/209558658-7ccfa8d0-a441-4f3d-a87b-0b44db6ad2f3.png)

* Host web app by using Azure App Service

```
az webapp up --name <yourwebappname> --resource-group <yourresourcegroup> --runtime "PYTHON:3.9" --location <yourlocation> --sku B1
```
- After hosting web app, you can open website by direct url

![image](https://user-images.githubusercontent.com/35824913/209563357-9048f9c1-5914-4bac-bdfc-9abb39534fe5.png)

* Run make_predict_azure_app.sh to make sure that web app are working properly

- You need to change yourappname in this file (the second line from bottom)

```bash
udacity@p2-udacity:~$ ./make_predict_azure_app.sh
```

- The result should be like this

![image](https://user-images.githubusercontent.com/35824913/209562303-2a6f581a-10a5-4a51-9d47-71bd3120b499.png)

### Configure Azure pipelines to apply Continuos Delivery

Azure devops deploy automatically your web application if github repo have any changes by using Azure pipelines.
Make sure that you have Parallel jobs to run the pipelines (Require Microsoft or purchase)

* Login to Azure devops

* Create a new project

* From created project page, go to Project settings

* In the left navigation, go to Services connection

* Click new service connection -> Azure Resource Manage -> Next -> Service principal (automatic)

* Enter your subscription, resource group and service connection name -> Save

* From your project left navigation, choose Pipelines -> new pipeline

* In connect tab -> choose Github -> choose your github repo

* In configure tab -> choose Python to Linux Web App on Azure -> choose your subscription -> choose your web app name -> click Validate and Configure

* After a yml file is created -> click Save and Run

* After running pipeline, you should receive the result like this:

![image](https://user-images.githubusercontent.com/35824913/209603221-308fc2bf-a526-4ee8-bc96-6f0bc69a972d.png)


* Now, if you make any changes to your github repo, It will trigger Azure pipelines to run which build your code and deploy your code automatically if building code successfully

## Enhancements

* Create UI for better look

## Demo 




