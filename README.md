## 初回にDBを作成する

### railsコンテナの ID or Name を取得する
```
docker container ls
```

### DB作成を実行
```
docker container exec <container ID or Name> rails db:create
```

## マイグレーション実行

```
docker container exec <container ID or Name> rails db:migrate
```
