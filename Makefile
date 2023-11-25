include .env

########################################### 共通コマンド ###########################################
#	環境の起動
up:
	docker-compose up -d

# 環境の動作終了
down:
	docker-compose down

# 環境の再起動
restart:
	@make down
	@make up

# dockerイメージの作成
build:
	docker-compose build --no-cache

########################################### apiに関するコマンド ###########################################
# apiコンテナ(NestJS)にアクセス
api-exec:
	docker-compose exec api bash

# railsプロジェクト新規作成
api-create-app:
	docker-compose exec api sh -c \
		"rails _7.0.4_ new ${API_PROJ_NAME} -O --skip-bundle && cd ${API_PROJ_NAME} && rm -rf .git"

# rails bundle
api-bundle:
	docker-compose exec api sh -c \
		"cd ${API_PROJ_NAME} && bundle _2.3.14_ install && bundle _2.3.14_ lock --add-platform x86_64-linux"

# rails server
api-server:
	docker-compose exec api sh -c \
		"cd ${API_PROJ_NAME} && rails s -b '0.0.0.0'"

# api イメージ削除
api-rmi:
	docker rmi $(shell basename `pwd` | tr 'A-Z' 'a-z')_api

# api volume削除
api-rmvol:
	docker volume rm $(shell basename `pwd` | tr 'A-Z' 'a-z')_api_store
# docker volume rm $(shell basename `pwd` | tr 'A-Z' 'a-z')_api_node_store
