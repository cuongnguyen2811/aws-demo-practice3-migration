#AWS Pipeline Deployment CICD: https://enlear.academy/deploy-your-spring-boot-application-using-codedeploy-and-codepipeline-4d853b1e486e

# Practice3: Build asp. net web app (with sql database) (can run locally) then publish to azure container registry through azure pipeline, then create a release to deploy web app + database to a ubuntu vm (using copy file docker-compose-vm.yml and ssh inline script to VM).

step1: https://www.youtube.com/watch?v=hpLvXNASyTI&list=PLzewa6pjbr3JQKhB_U_FiuYwQC70i-TyU
* download source code, run locally with default option in visual studio (demoblazerwebapp)
* remember to change db host, db database,.. in the file by the video.
* then if it worked fine, change the db host,... back to normal and build with dockercompose option in visual studio. After that, compose down.

step2: add a docker-compose-vm.yml to source code to deploy later (like the video show)

step3: create resource in azure: resource group, web app (open inbound port 8001 for web app), container registry, 
* ubuntu vm (https://www.youtube.com/watch?v=BjP9gbX6Orc) 
* turn of loggin for root (optional): https://stackoverflow.com/questions/24313562/root-login-ubuntu-vm-on-azure 
* install repository and docker engine: https://docs.docker.com/engine/install/ubuntu/
* install docker-compose (guide by ubuntu command line)
* docker login to azure container registry (credential from -> turn on in the access key tab on azure)
* docker credential helper (optional): https://www.youtube.com/watch?v=xAY45rca6Fk&t=302s https://www.youtube.com/watch?v=Tkj99gV6ZNA&t=71s (get full at the bottom of README.md)

step4: setting up service connection of subscription, docker registry and ssh connection

step5: build pipeline and release like this tutorial: https://kutsyk.medium.com/docker-compose-ci-cd-in-azure-devops-88858e6e8de
* remmember change that copy and publish the docker-compose-vm.yml, also change in the ssh inline for per use
* (setting automate CI and trigger for pipeline and release)

=> that's all. It's should worked on $(ip-of-ubuntu-vm):8001

addtional resource: https://codingcanvas.com/using-docker-compose-in-azure-devops-pipeline/
https://docs.docker.com/compose/extends/

###########################################################################################################################
# Blazor Server App and SQL Server Database - With Docker Compose

Watch Tutorial Video Now: https://www.youtube.com/watch?v=hpLvXNASyTI&list=PLzewa6pjbr3JQKhB_U_FiuYwQC70i-TyU&index=5

This is .Net Core Docker Tutorial [.Net Docker Tutorial] that explains how to containerize .Net application with SQL Server Database. Visual Studio provides the options to easily develop applications with Docker Support, Debug with Docker [Docker .Net Core Debug], and Deploy the Docker Container [Deploy .Net Core to Docker].

We are using the Official container image for Microsoft SQL Server on Linux for Docker Engine [SQL Server Docker]. We'll use this docker image for creating a container for SQL Server Database. Then the .Net Core application container can connect to the database container for read-write operations.

In this .NET Docker tutorial, you'll learn how to manage more than one container and communicate between them when using Container Tools in Visual Studio. Managing multiple containers requires container orchestration and requires an orchestrator such as Docker Compose, Kubernetes, or Service Fabric. Here, we'll use Docker Compose. Docker Compose is great for local debugging and testing in the course of the development cycle. This is a very important video as it covers a major part of Docker .Net Core Microservices.

Visual Studio provides a consistent way to develop Docker containers and validate your application locally. You can run and debug your apps in Linux or Windows containers running on your local Windows desktop with Docker installed, and you don't have to restart the container each time you make a code change.

You can view what's going on inside the containers that host your app by using the Containers window. If you're used to using the command prompt to run Docker commands to view and diagnose what's going on with your containers, this window provides a more convenient way to monitor your containers without leaving the Visual Studio IDE.

What is Docker Compose?
Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

Docker .Net Core:
.NET Core can easily run in a Docker container. Containers provide a lightweight way to isolate your application from the rest of the host system, sharing just the kernel, and using resources given to your application. Learn how to use docker for .Net Core and deploy .Net Core to Docker.

.NET Core images
Official .NET Core Docker images are published to the Microsoft Container Registry (MCR) and are discoverable at the Microsoft .NET Core Docker Hub repository. Each repository contains images for different combinations of the .NET (SDK or Runtime) and OS that you can use.
Microsoft provides images that are tailored for specific scenarios. For example, the ASP.NET Core repository provides images that are built for running ASP.NET Core apps in production.

The tools included in Visual Studio for developing with Docker containers [.Net Core Docker Container] are easy to use, and greatly simplify building, debugging, and deployment for containerized applications. You can work with a container for a single project, or use container orchestration with Docker Compose or Service Fabric to work with multiple services in containers.

Docker support in Visual Studio:
Docker support is available for ASP.NET projects, ASP.NET Core projects, and .NET Core and .NET Framework console projects.

The support for Docker in Visual Studio has changed over a number of releases in response to customer needs. There are two levels of Docker support you can add to a project, and the supported options vary by the type of project and the version of Visual Studio. With some supported project types, if you just want a container for a single project, without using orchestration, you can do that by adding Docker support. The next level is container orchestration support, which adds appropriate support files for the particular orchestrator you choose.

Docker support for a .Net Project [Blazor Docker]:
You can enable Docker support during project creation by selecting Enable Docker Support when creating a new project. You can add Docker support to an existing project by selecting Add - Docker Support in Solution Explorer. The Add - Docker Support and Add - Container Orchestrator Support commands are located on the right-click menu (or context menu) of the project node for an ASP.NET Core project in Solution Explorer.

#CodingDroplets #Docker #Microservices

#docker-credential-helpers-sample-command
* docker login $container-registry                 (docker hub or azure container registry)
* sudo apt-get install rng-tools -y
* sudo rngd -r /dev/urandom
* sudo apt-get install pass -y
* gpg --full-generate-key       (all default) 
* -------------docker_demo nguyenvancuong2811@gmail.com setting encrypted password for dockerid    o
* -------------passphrase: docker$2811
* mkdir ~/bin
* cd bin
* echo 'export PATH=$PATH:~/bin' >> ~/.bashrc
* wget https://github.com/docker/docker-credential-helpers/releases/download/v0.6.3/docker-credential-pass-v0.6.3-amd64.tar.gz
* tar xvzf docker-credential-pass-v0.6.3-amd64.tar.gz
* chmod a+x docker-credential-pass >> ~/.bashrc
* sudo cp docker-credential-pass /usr/local/bin >> ~/.bashrc
* logout

* mkdir ~/.docker
* gpg --list-secret-keys           (copy key below rsa)
* pass init $key-copy-above
* pass insert docker-credential-helpers/docker-pass-initialized-check
* -------------password: docker$2811
* sudo nano ~/.docker/config.json
* -------------add at the end of the file: { "experimental":"enabled" }
* -------------Ctrl S to save file > Y > Enter
* docker login
* docker logout
* docker login
* ------------- Username:         (username of azure container registry)
* ------------- password:         (password of azure container registry)


