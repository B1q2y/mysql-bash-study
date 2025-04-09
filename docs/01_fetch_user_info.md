# MySQL × Bash 学習記録 ① - fetch_table.sh / fetch_user_info.sh

## 📅 実施日

2025/04/09

## ✅ やったこと

- VSCode と GitHub を連携（Git Bash / D: ドライブ設定）
- `mysql-batch` コンテナを `docker-compose` で起動（ポート: 3606）
- `init.sql` で `users` テーブルと初期データ投入
- `.env.development` に接続情報を分離して管理
- `fetch_table.sh`: Bash から MySQL に接続して SELECT 実行
- `fetch_name.sh`: 最初の 1 人のユーザー名を変数に格納
- `fetch_all_user_info.sh`: 全ユーザーの名前とメールアドレスをループ処理
- SQL 出力をカンマ区切りに変換 → `read` で変数に分割

## 🧠 学んだこと

- `docker exec -i <container>` を使うと、ホスト経由ではなくコンテナ内で直接 mysql 実行できる
- Bash で MySQL 出力を変数に受け取るには `$(...)`＋`read`＋区切り指定が重要
- スペースを含む値（名前など）はカンマ区切り出力＋`IFS=','`がベスト

## ✅ スクリプト一覧

- `scripts/fetch_table.sh`：テーブル全体を表示
- `scripts/fetch_name.sh`：最初のユーザー名を変数で取得
- `scripts/fetch_user_by_id.sh`：id=1 のデータを `user`, `email` に格納
- `scripts/fetch_user_info.sh`：全ユーザーをループ処理で表示

## 🔜 次にやること（ToDo）

- 結果を CSV 形式で保存してみる
- テーブル名や WHERE 条件を引数で渡せるように改良
- 定期実行（cron or シェルループ）など実務的運用の練習
