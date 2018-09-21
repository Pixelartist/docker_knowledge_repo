# docker_knowledge_repo
Airbnb Knowledge Repo dockerized

http://127.0.0.1:7000

docker run -it -p 7000:7000 -v /Users/manuelmueller/Documents/projects/docker_knowledge_repo:/home/base docker_knowledge_repo

knowledge_repo --repo <repo_path> runserver

knowledge_repo --repo /home/knowledge_repo/ runserver --config /home/knowledge_repo/config_defaults.py



TODO deployment key from github


-= Postgresql Database Setup =-
EXECUTE docker run -p 5432:5432 --name knowledgedb -e POSTGRES_PASSWORD=secret -d postgres
172.17.0.2

INFO - user postrges, db postgres
INFO - postgresql://postgres:secret@172.17.0.2:5432/postgres
EXECUTE psql -h localhost -p 5432 -U postgres
EXECUTE create database knowledge_repo;

-= Basic Setup =-

-= Run Knowledge Repo =-
docker run -p 80:7000 --name knowledge_repo debian bash

install deployment key from GitHub
 - run -> ssh-keygen -t rsa -b 4096 -C "{email}"#
 - get the keys into the root ssh folder
 - check if the agent for ssh is running -> eval "$(ssh-agent -s)"
 - add the key -> ssh-add -k ~/.ssh/******
 - add the key to github in "deployment keys"
 - check if it is working by using -> ssh -T git@github.com
 - INFO Do not use http path to clone the repository, http will request authorization and skip the key.
