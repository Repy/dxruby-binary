# DXRuby バイナリ配布

Ruby 3.1 ～ 3.4 で動作する [DXRuby](https://github.com/mirichi/dxruby) のビルドを配布しています。  
x64版ではSoundクラスは動作しませんので、音楽部分は他のライブラリを使用してください。

ビルドするためにある程度パッチしています。  
パッチの内容は [Repy/dxruby](https://github.com/Repy/dxruby) からご覧ください。

## インストール方法（初心者向け）

1. RubyInstaller公式サイトから最新版のRubyをダウンロードします。
    - Devkitの有無は問いません。
    - わからない場合は、 with Devkit の x86 をダウンロードしましょう。
2. ダウンロードしたインストーラーを実行してインストールします。
3. スタートメニューから「Start Command Prompt with Ruby」を立ち上げます。
4. ターミナルが立ち上がるので、以下のコマンドを入力します。
    ```
    powershell -Command "Invoke-WebRequest -Uri https://repy.github.io/dxruby-binary/gems/dxruby-1.4.7.gem -OutFile dxruby-1.4.7.gem"
    gem.cmd install -l dxruby
    ```

## Bundlerでのインストール(Gemfile)

sourceを指定して記述してください。

```
source "https://repy.github.io/dxruby-binary" do
  gem "dxruby"
end
```
