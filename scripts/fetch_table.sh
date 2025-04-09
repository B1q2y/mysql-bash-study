#!/bin/bash

# 環境変数読み込み（開発環境用）
set -o allexport
source ./env/.env.development
set +o allexport

# MySQL 実行（docker execを想定）
docker exec -i mysql-batch \
  mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" \
  -e "SELECT * FROM users;"
