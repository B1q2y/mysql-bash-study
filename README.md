# MySQL × Bash スクリプト学習リポジトリ

このリポジトリは、Docker 上の MySQL に対して Bash からデータを取得し、  
変数に代入・ループ処理・条件分岐などの操作を行うための学習用スクリプトをまとめたものです。

---

## 📦 セットアップ手順

### 1. 環境構築（初回のみ）

```bash
cd env/
docker compose -f docker-compose.mysql.yml up -d
```

- MySQL 8.0 を使用
- ポートは `3606` を使用
- 起動時に `init.sql` により `users` テーブルと初期データが投入されます

### 2. `.env` の作成

`env/.env.development` に以下を定義します（※Git には含めないように `.gitignore` 済）：

```env
MYSQL_USER=myuser
MYSQL_PASSWORD=mypass
MYSQL_DATABASE=mydb
```

---

## 🚀 主なスクリプト

| ファイル              | 説明                                                           |
| --------------------- | -------------------------------------------------------------- |
| `fetch_table.sh`      | users テーブルを全件表示                                       |
| `fetch_name.sh`       | 最初のユーザーの name を変数に格納                             |
| `fetch_user_by_id.sh` | `id=1` の name, email をそれぞれの変数に格納                   |
| `fetch_user_info.sh`  | 全ユーザーの name/email をループ処理して表示（カンマ分割対応） |

---

## 📝 学習記録

詳細な学習メモはこちらに記録しています：

📄 [`docs/01_fetch_user_info.md`](docs/01_fetch_user_info.md)

---

## 🔜 今後やる予定

- SELECT 結果を CSV 出力して保存
- テーブル名・WHERE 条件を引数で切り替えられるようにする
- cron で定期実行するスケジュールバッチを作る
