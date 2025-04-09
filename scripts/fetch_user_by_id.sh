#!/bin/bash

# 環境変数を読み込み
set -o allexport
source ./env/.env.development
set +o allexport

# カンマ区切りで出力
USER_INFO=$(docker exec -i mysql-batch \
  mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" \
  -N -e "SELECT CONCAT(name, ',', email) FROM users WHERE id = 1 ;")

echo "$USER_INFO" | while IFS=',' read -r user email; do
  echo "ユーザー名: $user"
  echo "メールアドレス: $email"
done

