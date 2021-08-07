.PHONY: frontend webapp payment bench

all: bench

start:
	docker-compose -f webapp/docker-compose.yml -f webapp/docker-compose.go.yml up
stop:
	docker-compose -f webapp/docker-compose.yml -f webapp/docker-compose.go.yml down
bench:
	bench/bin/bench_darwin run --payment=http://127.0.0.1:5000 --target=http://127.0.0.1:8080 --assetdir=webapp/frontend/dist | tee log_`date '+%s'`.log

clean:
	cp /dev/null webapp/logs/nginx/web_access.ltsv
	cp /dev/null webapp/logs/mysql/mysql-slow.sql

deploy: deploy_mark
# "練習環境(docker)のため、deployは何もしない。make startでgoのコンパイルもされる"

deploy_mark:
	./deployment_mark.sh

