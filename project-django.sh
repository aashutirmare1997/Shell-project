#!/bin/bash

<< comment
This script is about Django project set-up
comment

clone(){

	if [[ -d "django-notes-app" ]];
	then
		echo "The directory already exist, Cloning Skipped....."
	else
		echo "Cloning git Code......."
	        git clone https://github.com/aashutirmare1997/django-notes-app.git
	fi
}


installing_requirements(){

	cd django-notes-app/
	sudo apt-get update
	echo "Installing Requirements......."
	if ! command -v docker &> /dev/null && ! command -v nginx &> /dev/null && ! command -v nginx &> /dev/null; 
	then
                 sudo apt-get install -y nginx docker.io docker-compose
        else
                 echo "Docker, Nginx, Docker-Compose are already installed."
        fi
}

required_restarts(){

	echo "Restarting services...."
	sudo chown "$USER" /var/run/docker.sock ||
	sudo systemctl restart docker
	sudo systemctl enable nginx
	sudo systemctl enable docker
}

deployment(){

	docker build -t notes-app . && docker-compose  up -d
}

clone
installing_requirements
required_restarts
deployment
