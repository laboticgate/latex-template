# らぼちっく；げーと LaTeXテンプレート
## 概要
このリポジトリは、技術系同人サークル「らぼちっく；げーと」が同人誌制作で利用しているLaTeXテンプレートと、利用方法を記載したサンプル記事を格納したものです。らぼちっく；げーとでは、2017年ごろからこのテンプレート（およびその過去バージョン）を利用して同人誌を制作しています。このリポジトリ1つをもとに記事が1つでき、それらを結合したPDFを作成して入稿する想定です。

## 使い方
このリポジトリを取得してmakeすると、PDFが生成される状態になっています。PDFのサイズは入稿サイズを想定し、JB5サイズに上下左右それぞれ10mmの塗り足しがある状態（202mm x 277mm）です。LaTeX環境がまだ整っていなければ、先に環境構築を実施してください（後述）。

```bash
git clone https://github.com/laboticgate/latex-template.git
cd latex-template
make
ls main.pdf
```

記事のタイトルや著者情報などの基本情報は `main.tex` に、記事の内容は `content.tex` に記載します。画像の配置場所は任意ですが、このテンプレートでは `images` ディレクトリ配下に保存しています。再度makeコマンドを実行すると、新しい内容でPDFが生成されます。

```bash
make
```

入稿用のPDFファイルを生成するには、makeターゲットにoutlineを指定してください。PDF全体がアウトライン化され、フォントの埋め込み問題や印刷時のズレ等が発生しなくなります。

```bash
make outline
```

仕上がり（ページ上下左右にある塗り足し断ち切り後）のレイアウトを確認したい場合は、makeターゲットにpreviewを指定してください。上下左右の塗り足しが切り取られたJB5サイズ（182mm x 257mm）のPDFが生成されます。

```bash
make preview
```

複数のPDFを結合したい場合は、pdftkを使ってください。

```bash
pdftk article1.pdf article2.pdf article3.pdf cat output articles.pdf
```

## LaTeX環境構築例（Ubuntu 24.04）
LaTeXソースをコンパイルするための環境構築がまだの場合は、次の要領で必要なパッケージをインストールしてください。

```bash
sudo apt update
sudo apt install \
     texlive-lualatex \
     texlive-lang-japanese \
     texlive-latex-extra \
     texlive-bibtex-extra \
     texlive-extra-utils \
     ghostscript \
     pdftk \
     make
```

## ライセンス
LaTeX Project Public License 1.3c
