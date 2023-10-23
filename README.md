HubSpotとGitHubを用いたWeb開発フローにおけるローカルPC環境構築の手順をご説明いたします。以下は、PMおよび実装担当者が行うべき手順です。

## A. ローカルPC初期設定（PMおよび実装担当者）

### 1. Homebrewのインストール
[Homebrew](https://brew.sh/ja/)はmacOS向けのパッケージマネージャであり、便利なツールやソフトウェアのインストールを支援します。以下のコマンドを実行してHomebrewをインストールします。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Wrap2（コマンドラインツール）のインストール
[Wrap2](https://www.warp.dev/)はコマンドラインツールであり、ローカル開発環境を簡単にセットアップできます。以下のコマンドを実行してWrap2をインストールします。

```bash
brew install --cask warp
```

### 3. Visual Studio Codeのインストール
[Visual Studio Code (VS Code)](https://code.visualstudio.com/)は軽量で高機能なコードエディタであり、Web開発に適しています。以下のコマンドを実行してVS Codeをインストールします。

```bash
brew install --cask visual-studio-code
```

### 4. Dockerのインストール
[Docker](https://www.docker.com/)はコンテナベースのアプリケーションの構築、配布、実行を容易にするプラットフォームです。以下のコマンドを実行してDockerをインストールします。

```bash
brew install --cask docker
```

### 5. Dockerバージョン確認
Dockerのインストールが正常に完了したか確認するため、以下のコマンドを実行してDockerのバージョンを確認します。

```bash
docker -v
```

### 6. wrap2やVisual Studio Codeは各自カスタマイズしてください。

## B. プロジェクト開始時点での設定（PMもしくは、実装管理者）

以下は、プロジェクト開始時にベースとなるリポジトリを整えるための手順です。

### 1. リポジトリの作成
GitHub上で新しいリポジトリを作成します。ブランチは`main`と`develop`を作成し、これらのブランチを保護設定します。


### 2. メンバーの招待
プロジェクトメンバーをリポジトリに招待します。


### 3. シークレットの登録
プロジェクトリーダーからリポジトリのURLを受け取り、GitHub Actionsで利用するシークレットを登録します。
- [GitHub Actionsでのシークレット利用ガイド](https://docs.github.com/ja/actions/security-guides/using-secrets-in-github-actions)
- [GitHub Actions環境変数とシークレットの利用方法](https://dev.classmethod.jp/articles/github-actions-environment-secrets-and-environment-variables/)


### 5. ローカルPCでこのリポジトリのファイルをDLして、フォルダ名をrenameしてそのフォルダまでコマンドで入る
```bash
docker-compose up
docker-compose ps //>>コンテナ名が出てくる
docker container exec -it hubspot_develop_env bash
```


### 6. Git Actionsの設定ファイルを設定（.github/workflows/main.yml）
GitHub Actionsを利用してHubSpotのCMSデプロイを設定するための設定ファイル（`.github/workflows/main.yml`）を更新します。主に、デプロイ先（クライアント）を指定します。

- [GitHub Marketplace - HubSpot CMS Deploy Action](https://github.com/marketplace/actions/hubspot-cms-deploy?__hstc=191447093.e2828a7aeadc4cbbb81fa971745616d3.1684904509151.1696319292546.1696324978632.77&__hssc=191447093.1.1696468240347&__hsfp=2849964017&hsCtaTracking=e0132707-395d-4617-bd9d-0b21c8b129d5%7Ce4078581-d84c-446e-9399-ce2ebcb21fae)
- [GitHub Actions設定ファイルのサンプル](https://docs.google.com/document/d/13HcLaZsA53W8PjleEQDPkh8bKRVLOvmv_22HrcvYQCs/edit)


### 7. 生成したリポジトリに初回コミット（コンテナの中に入った状態にしてください）
```bash
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
```
生成したボイラーテンプレートを含むリポジトリに初回のコミットを行います。



以下は、プロジェクトの中でローカルPC上で各個人が行う作業手順をMarkdown形式で表現したものです。

## C. ローカルPC上で各個人が行う作業

### 1. 作業ディレクトリの生成
おすすめは、ユーザーディレクトリに`/dev`ディレクトリを生成してその中にプロジェクトディレクトリを生成します。

```bash
mkdir /path/to/folder
```

### 2. ベースとなるリポジトリのクローン
プロジェクトリーダーもしくは開発リーダーからリポジトリのURLを取得し、以下のコマンドでクローンします。アクセス権がない場合は、認証を行います。

```bash
docker-compose up
docker-compose ps //>>コンテナ名が出てくる
docker container exec -it コンテナ名 bash
git clone リポジトリのURL
```

### 3. ブランチの作成
ブランチを作成します。詳細は[こちら](https://atmarkit.itmedia.co.jp/ait/articles/2110/01/news034.html)を参照してください。（ブランチ名は、feature_hayashiなどが良いかと。）

### 3. 担当箇所のコーディング
コーディング作業を行います。

### 4. ステージングおよびコミット
変更したファイルをステージングし、コミットします。

```bash
git add -A
git commit -m "message"
```

### 5. リモートリポジトリにプッシュ
ローカルで作成したブランチをリモートリポジトリにプッシュします。詳細は[こちら](https://atmarkit.itmedia.co.jp/ait/articles/2110/01/news034.html)を参照してください。

```bash
git push
```

### 6. Pull Requestの作成
プルリクエストを作成し、`develop`ブランチにマージするための準備をします。詳細は[こちら](https://style.potepan.com/articles/33561.html)を参照してください。

### 7. ローカルブランチの更新
プルリクエストが承認され、`develop`ブランチまたは`main`ブランチにマージされるので、両方のブランチをプルします。

### 8. 3~7を繰り返して構築作業を行う
15~19の作業ステップを必要に応じて繰り返します。


### マージを行う人（PMもしくは実装リーダー）の作業

### 1. Pull Requestの確認
GitHub上でプルリクエストを確認します。

### 2. H&K用ポータル（`develop`ブランチ）にマージ
プルリクエストを`develop`ブランチにマージします。

### 3. `main`ブランチにプルリクにマージ
`main`ブランチに対してプルリクエストを作成します。

### 4. クライアントポータル（`main`ブランチ）のブランチにマージ
プルリクエストを`main`ブランチにマージします。

### 5. 1~4を繰り返し行う

### 参考
[https://developers.hubspot.jp/docs/cms/guides/github-integration](https://developers.hubspot.jp/docs/cms/guides/github-integration)

[https://www.asobou.co.jp/blog/web/githistory](https://www.asobou.co.jp/blog/web/githistory)


