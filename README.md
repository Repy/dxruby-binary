# ruby-dxruby-binary

Ruby 3.1 ～ 3.4のx86版で動作するDXRubyのビルドを配布しています。  
x64版では動作しません。

## インストール方法

ruby-dxruby-binaryがビルドしたレポジトリを指定することでダウンロードできます。

```
gem install --source https://repy.github.io/ruby-dxruby-binary dxruby
```

## Bundlerでのインストール(Gemfile)

sourceを指定して記述してください。

```
source "https://repy.github.io/ruby-dxruby-binary" do
  gem "dxruby"
end
```

## 手動でgemファイルをダウンロード

手動インストールしたい人は右のReleasesからgemファイルをダウンロードし、gemファイルがあるディレクトリで以下のコマンドを実行してください。

```
gem install -l dxruby
```
