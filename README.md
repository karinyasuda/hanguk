# hanguk


2015/12/14
xmlファイルにエラー
ファイルの位置はここ。

/private/var/folders/8s/6q_0pmqj4vjg983wq_2w8qkr0000gn/T/B598CE75-BE3A-424A-A0B4-7E0C0D51CC23
違うと言われているところが見つけられない

全文はこちら
<?xml version="1.0" encoding="UTF-8"?>
<package version="software5.3" xmlns="http://apple.com/itunes/importer">
<software_assets apple_id="1054879622"
bundle_short_version_string="1.1"
bundle_version="1.1.9"
bundle_identifier="com.karin.hanguk00"
app_platform="ios">
<asset type="bundle">
<data_file>
<file_name>hanguk.ipa</file_name>
<checksum type="md5">8a85ff78fe51988f5f0f2945b28b4ec5</checksum>
<size>28235914</size>
</data_file>
</asset>
</software_assets>
</package>







2015/10/24
    バナーのサイズに関しての表を追加しておく。



320x50		標準のバナー             携帯電話とタブレット      kGADAdSizeBanner
320x100		バナー大                携帯電話とタブレット      kGADAdSizeLargeBanner
300x250		IAB レクタングル（中）    携帯電話とタブレット      kGADAdSizeMediumRectangle
468x60		IAB フルサイズ バナー     タブレット              kGADAdSizeFullBanner
728x90		IAB ビッグバナー         タブレット              kGADAdSizeLeaderboard
表を参照		スマート バナー          携帯電話とタブレット      kGADAdSizeSmartBannerPortrait
                                                         kGADAdSizeSmartBannerLandscape


今回使っているのは　　kGADAdSizeSmartBannerPortrait　


ld: 'ライブラリ名' does not contain bitcode. You must rebuild it with bitcode enabled (Xcode setting ENABLE_BITCODE), 
obtain an updated library from the vendor, or disable bitcode for this target. for architecture arm64
と、Bitcodeにエラーが出た。　Xcode7.2では　Unable Bitcode　= Yes　に勝手に設定されちゃう。
7.1以前のversionで作ったものは対応したデータが含まれていないので、Noでなければいけない。Noに直せば動く。

2015/11/15
無効なsdk値です。というエラーが出てしまってビルドの提出したものが、審査へ提出できないという状態
sdkで指定されているのは9.2だけど最大値9.1を超えていると。
どこで直せばいいのかわからず、解決できていない。

他に、ビルドの提出はβ版でしちゃあかんと言われたのでβ版を消してちゃんとした最新版9.1対応をダウンロードする。
なお、今回は、ipadに対応していなかったことからrejectされた。

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