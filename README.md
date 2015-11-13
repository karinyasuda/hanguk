# hanguk
ld: 'ライブラリ名' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), 
obtain an updated library from the vendor, or disable bitcode for this target. for architecture arm64
と、Bitcodeにエラーが出た。　Xcode7.2では　Unable Bitcode　= Yes　に勝手に設定されちゃう。
7.1以前のversionで作ったものは対応したデータが含まれていないので、Noでなければいけない。Noに直せば動く。
