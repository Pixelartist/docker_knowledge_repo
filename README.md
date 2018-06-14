# docker_knowledge_repo
Airbnb Knowledge Repo dockerized

http://127.0.0.1:7000

docker run -it -p 7000:7000 -v /Users/manuelmueller/Documents/projects/docker_knowledge_repo:/home/base docker_knowledge_repo

knowledge_repo --repo <repo_path> runserver

knowledge_repo --repo /home/knowledge_repo/ runserver --config /home/knowledge_repo/config_defaults.py

docker run -p 5432:5432 --name knowledgedb -e POSTGRES_PASSWORD=secret -d postgres
172.17.0.2

user postrges, db postgres

postgresql://postgres:secret@172.17.0.2:5432/postgres
