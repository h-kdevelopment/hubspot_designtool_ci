HubSpotとGitHubを用いたWeb開発フローにおけるローカルPC環境構築の手順をご説明いたします。以下は、PMおよび実装担当者が行うべき手順です。

# ローカルPC初期設定（PMおよび実装担当者）

## 1. Homebrewのインストール
[Homebrew](https://brew.sh/ja/)はmacOS向けのパッケージマネージャであり、便利なツールやソフトウェアのインストールを支援します。以下のコマンドを実行してHomebrewをインストールします。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. Wrap2（コマンドラインツール）のインストール
[Wrap2](https://www.warp.dev/)はコマンドラインツールであり、ローカル開発環境を簡単にセットアップできます。以下のコマンドを実行してWrap2をインストールします。

```bash
brew install --cask warp
```

## 3. Visual Studio Codeのインストール
[Visual Studio Code (VS Code)](https://code.visualstudio.com/)は軽量で高機能なコードエディタであり、Web開発に適しています。以下のコマンドを実行してVS Codeをインストールします。

```bash
brew install --cask visual-studio-code
```

## 4. Dockerのインストール
[Docker](https://www.docker.com/)はコンテナベースのアプリケーションの構築、配布、実行を容易にするプラットフォームです。以下のコマンドを実行してDockerをインストールします。

```bash
brew install --cask docker
```

## 5. Dockerバージョン確認
Dockerのインストールが正常に完了したか確認するため、以下のコマンドを実行してDockerのバージョンを確認します。

```bash
docker -v
```

### 参考