# hanguk
ld: 'ライブラリ名' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), 
obtain an updated library from the vendor, or disable bitcode for this target. for architecture arm64
と、Bitcodeにエラーが出た。　Xcode7.2では　Unable Bitcode　= Yes　に勝手に設定されちゃう。
7.1以前のversionで作ったものは対応したデータが含まれていないので、Noでなければいけない。Noに直せば動く。

2015/11/15
無効なsdk値です。というエラーが出てしまってビルドの提出したものが、審査へ提出できないという状態
sdkで指定されているのは9.2だけど最大値9.1を超えていると。
どこで直せばいいのかわからず、解決できていない。

他に、ビルドの提出はβ版でしちゃあかんと言われたのでβ版を消してちゃんとした最新版9.1対応をダウンロードする。



==============================================================================================================
以下、reject内容全文　from Apple　+スクリーンショットの写真が一枚ついてた。

差出人: Apple
2.10 - iPhone Apps must also run on iPad without modification, at iPhone resolution, and at 2X iPhone 3GS resolution
2.10 Details

We noticed that your app did not run at iPhone resolution when reviewed on iPad running iOS 9.1, which is a violation of the App Store Review Guidelines. We’ve attached screenshot(s) for your reference.

Specifically, your app screen is not optimized for iPad and the screen is cropped. 

Next Steps

Please revise your app to ensure it runs at iPhone resolution on iPad.

Resources

For information on iOS device screen sizes and resolutions, please see the iOS Human Interface Guidelines as well as the Points versus Pixels in the View Programming Guide for iOS.

If you have difficulty reproducing a reported issue, please try testing the workflow described in Technical Q&A QA1764: How to reproduce bugs reported against App Store submissions.

If you have code-level questions after utilizing the above resources, you may wish to consult with Apple Developer Technical Support. When the DTS engineer follows up with you, please be ready to provide:
- complete details of your rejection issue(s)
- screenshots
- steps to reproduce the issue(s)
- symbolicated crash logs - if your issue results in a crash log
=======================================================================================================