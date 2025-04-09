#!/bin/bash

# 環境変数読み込み
set -o allexport
source ./env/.env.development
set +o allexport

# 1件目のユーザー名を取得
USER_NAME=$(docker exec -i mysql-batch \
  mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" \
  -N -e "SELECT name FROM users LIMIT 1;")

# 結果表示
echo "取得したユーザー名: $USER_NAME"
