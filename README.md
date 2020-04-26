# 基本データ分析用Dockerfile
numpy, pandas, matplotlib, sklearnなどを搭載したjupyter notebookを立ち上げられる基本Dockerfile

# how to use
1. dockerとdocker-composeのインストールと初期設定
2. `docker-compose.yml`の`ports`および`command: jupyter notebook --port`を適宜設定
3. `git clone https://github.com/GENZITSU/jupyter_base_dockerfile.git`
4. `cd jupyter_base_dockerfile`
5. `docker compose up` / `docker compose up -d`(バックグラウンド実行)
6. ブラウザで`http://localhost:<指定したport>` にアクセス