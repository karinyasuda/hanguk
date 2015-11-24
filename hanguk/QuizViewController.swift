//
//  QuizViewController.swift
//  hanguk
//
//  Created by Karin on 2015/10/25.
//  Copyright © 2015年 Karin. All rights reserved.
//
//var sum:Int = 0

import UIKit
import GoogleMobileAds

class QuizViewController: UIViewController, GADBannerViewDelegate {

    
//    @IBOutlet weak var GAdbanner: GADBannerView!
    //正しい正解の問題を教えてくれるラベル　間違った時のみ表示される
    @IBOutlet var answerlabel:UILabel!
    
    //出題数
    var questionNumber:Int = 10
    
    //クイズの問題を入れる配列
    var qArray  = [AnyObject]()
  //-------------------------------------
//    //qArrayを入れる配列
//    var quizArray = [AnyObject]()
  //------------------------------------
    //現在の問題数
    var sum:Int = 0
    
    //乱数
    var random:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //timer だけどたぶんいま使ってない
//    var timer : NSTimer!
    
    var viewFrame = CGRectZero
    var contentRect = CGRectZero
    
    //クイズの問題を表示するlabel
    @IBOutlet var questionLabel:UILabel!

    //plusとminusの画像を表示するためのimageview
    @IBOutlet var plusImage:UIImageView!
    @IBOutlet var minusImage:UIImageView!
    
    
    //問題をついのものに切り替えるボタン
    @IBOutlet var nextButton:UIButton!
   
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.answerlabel.hidden =                       true
        self.minusImage.hidden = true
        self.plusImage.hidden = true
        self.nextButton.hidden = true
        nextButton.layer.cornerRadius = 10
        answerlabel.layer.cornerRadius = 20
        self.answerlabel.clipsToBounds = true

        
        
//        var qArray = [AnyObject]()
        
        //クイズの問題　30問分の型の用意
        
        qArray.append(["술프다","悲しい","うれしい","くやしい","疲れた",1,"悲しい"])
        qArray.append(["못하다","召し上がる","上手だ","下手だ","えらい",3,"下手だ"])
        qArray.append(["그런대","だから","ところで","それで","そして",2,"ところで"])
        qArray.append(["삼각김밥","おかず","のりべん","のりまき","おにぎり",4,"おにぎり"])
        qArray.append(["빵","ごはん","部屋","夜","パン",4,"パン"])
        
        qArray.append(["열쇠","夢","引越し","鍵","略図",3,"鍵"])
        qArray.append(["노래방","住所","カラオケ","招待状","歌謡曲",2,"カラオケ"])
        qArray.append(["좋은 꿈뀌","おやすみなさい","早く寝てください","先に寝ますね","いい夢みてね",4,"いい夢みてね"])
        qArray.append(["이사하다","引越し","住所","転勤する","説明する",1,"引越し"])
        qArray.append(["시험","時期","時間","試験","睡眠",3,"試験"])
        
        qArray.append(["술","お酒","スープ","さじ","お酢",1,"お酒"])
        qArray.append(["돈","おもち","お金","木材","金属",2,"お金"])
        qArray.append(["돌아가나","招待する","歩いていく","間違える","帰る",4,"帰る"])
        qArray.append(["사용","使う","あげる","ひっこし","連絡",1,"使う"])
        qArray.append(["열락","招待状","使う","連絡","出口",3,"連絡"])
        
        qArray.append(["설연","理解","略図","解説","説明",4,"説明"])
        qArray.append(["조금","少し","さっき","いつか","もうすぐ",1,"少し"])
        qArray.append(["다섯봉지","５袋","４まい","５本","６匹",1,"５袋"])
        qArray.append(["딸","娘","息子","おば","妹",3,"おば"])
        qArray.append(["가을","秋","秋です","春","季節",1,"秋"])
        
        qArray.append(["방","部屋","パン","ごはん","冬",1,"部屋"])
        qArray.append(["밤","パン","ごはん","息子","部屋",2,"ごはん"])
        qArray.append(["반찬","秋","さっき","すこし","おかず",4,"おかず"])
        qArray.append(["주먹밥","巻き寿司","おにぎり","おかず","おかゆ",2,"おにぎり"])
        qArray.append(["특히","聞き取り","悲しみ","特に","楽しい",3,"特に"])
        
        qArray.append(["배","船着場","雨","チケット","船",4,"船"])
        qArray.append(["또","〜も","また","チケット","家",2,"また"])
        qArray.append(["댁","お宅","壁","家","土",1,"お宅"])
        qArray.append(["설날","週末","祝日","正月","平日",3,"正月"])
        qArray.append(["외국","外国","イギリス","アメリカ","オランダ",1,"外国"])
        
//        
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        qArray.append(["","","","","",])
//        
        
        
        //ここで問題を表示する！
         choiceQuiz()
        
        
        
//        //-------------------------------------------------------------
//        srand(UInt32(time(nil)))
//        while(qArray.count > 0){
//            let random = Int (rand()) % qArray.count
//            
//            quizArray.append(qArray[random])
//            qArray.removeAt(random)
//            
        
//            questionLabel.text = quizArray[0][0] as! NSString as String
        
        //---------------------------------------------------------------
            
            
            
            
            
       
//        }
        //★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
        //ここ、GOOGLE ADMOB
      
        (frame: CGRectZero)
        let bannerView:GADBannerView = GADBannerView (adSize: kGADAdSizeSmartBannerPortrait)
        bannerView.frame.origin.y = contentRect.height
//        bannerView.frame.size.width = contentRect.width
        //広告UnitIDを指定するw
        print("Google Mobile Ads SDK version:\(GADRequest.sdkVersion())")
        bannerView.adUnitID = "ca-app-pub-3198611449404323/4707284097"
        bannerView.delegate = self
        bannerView.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        gadRequest.testDevices = [kGADSimulatorID] // テスト時のみ
        bannerView.loadRequest(gadRequest)
        self.view.addSubview(bannerView)
        
        
        
    }

    func choiceQuiz() {
//        print(quizArray.count)
        self.plusImage.hidden = true
        self.minusImage.hidden = true
        self.answerlabel.hidden = true
        self.nextButton.hidden = true
        
        
        
//        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(qArray.count)))
//
        questionLabel.text = qArray[random][0] as! NSString as String

        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle((qArray[random][i+1] as! NSString) as String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    
    //答えのボタンを４つの中から選んだ時のアクション
    @IBAction func choiceAnswer(sender: UIButton) {
        
        sum++
        print("random \(random)")
        print(sum)

        //この書き方のas!とか[randim][5]とかわからん
        if qArray[random][5] as! Int == sender.tag {
            //あってたら
            //→正解数を増やす
            correctAnswer++
            
            self.plusImage.hidden = false
              self.minusImage.hidden = true
              self.answerlabel.hidden = true
            self.nextButton.hidden = false
            //正しい答えと×が消える
            //○と次のViewに移るボタンが表示される
//          sumが10って宣言してある　questionNumber と等しくなったら　画面遷移　segue呼びだし
            if sum == questionNumber {
                performSegueToResult()}
            
        }
            //間違ってたら
        else {
              self.plusImage.hidden = true
            self.minusImage.hidden = false
            self.answerlabel.hidden = false
            self.nextButton.hidden = false
            //○が表示される
            //正しい答えと×と次のViewに移るボタンが表示される
            answerlabel.text = qArray[random][6] as! NSString as String

            
            //解いた問題数の合計（sum）が予め設定していた問題数に達したら結果画面へ
//
//        if sum == questionNumber {
//            performSegueToResult()
        }
        

    }
    @IBAction func nextButton(sender:UIButton){
        if sum == questionNumber {
            performSegueToResult()
        }
        choiceQuiz()
    }
    
    //結果画面への遷移segue
    func performSegueToResult() {
        performSegueWithIdentifier("ResultView", sender: nil)
    }
    
    
    //データ受け渡してる？
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "ResultView") {
            let ResultView : ResultViewController = segue.destinationViewController as! ResultViewController
            //ResultViewのcorrectAnswerに正解数を格納
            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
