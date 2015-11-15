# hanguk
ld: 'ライブラリ名' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), 
obtain an updated library from the vendor, or disable bitcode for this target. for architecture arm64
と、Bitcodeにエラーが出た。　Xcode7.2では　Unable Bitcode　= Yes　に勝手に設定されちゃう。
7.1以前のversionで作ったものは対応したデータが含まれていないので、Noでなければいけない。Noに直せば動く。

無効なsdk値です。というエラーが出てしまってビルドの提出したものが、審査へ提出できないという状態
sdkで指定されているのは9.2だけど最大値9.1を超えていると。
どこで直せばいいのかわからず、解決できていない。