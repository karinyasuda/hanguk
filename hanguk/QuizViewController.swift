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

class QuizViewController: UIViewController, GADBannerViewDelegate{

    //出題数
    var questionNumber:Int = 10
    

    
    //クイズの問題を入れる配列
    var qArray  = [AnyObject]()
    
    //現在の問題数
    var sum:Int = 0
    
    //乱数
    var random:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    var timer : NSTimer!
    
    //クイズの問題を表示するlabel
    @IBOutlet var questionLabel:UILabel!

    //plusとminusの画像を表示するためのimageview
    @IBOutlet var plusImage:UIImageView!
    @IBOutlet var minusImage:UIImageView!
    
    
    
    
    @IBOutlet var choiceButtons: Array<UIButton>!
    //選択肢のボタン
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minusImage.hidden = true
        self.plusImage.hidden = true
        
//        var qArray = [AnyObject]()
        
        //クイズの問題　30問分の型の用意
        
        qArray.append(["술프다","悲しい","うれしい","くやしい","疲れた",1])
        qArray.append(["못하다","召し上がる","上手だ","下手だ","えらい",3])
        qArray.append(["그런대","だから","それなのに","それで","そして",2])
        qArray.append(["삼각김밥","おかず","のりべん","のりまき","おにぎり",4])
        qArray.append(["빵","ごはん","部屋","夜","パン",4])
        
        qArray.append(["열쇠","夢","引越し","鍵","略図",3])
        qArray.append(["노래방","住所","カラオケ","招待状","歌謡曲",2])
        qArray.append(["좋은 꿈뀌","おやすみなさい","早く寝てください","先に寝ますね","いい夢みてね",4])
        qArray.append(["이사하다","引越し","住所","転勤する","説明する",1])
        qArray.append(["시험","時期","時間","試験","睡眠",3])
        
        qArray.append(["술","お酒","スープ","さじ","お酢",1])
        qArray.append(["돈","おもち","お金","木材","金属",2])
        qArray.append(["돌아가나","招待する","歩いていく","間違える","帰る",4])
        qArray.append(["사용","使う","あげる","ひっこし","連絡",1])
        qArray.append(["열락","招待状","使う","連絡","出口",3])
        
        qArray.append(["설연","理解","略図","解説","説明",4])
        qArray.append(["조금","少し","さっき","いつか","もうすぐ",1])
        qArray.append(["다섯봉지","５袋","４まい","５本","６匹",1])
        qArray.append(["딸","娘","息子","おば","妹",3])
        qArray.append(["가을","秋","秋です","春","季節",1])
        
        qArray.append(["방","部屋","パン","ごはん","冬",1])
        qArray.append(["밤","パン","ごはん","息子","部屋",2])
        qArray.append(["반찬","秋","さっき","すこし","おかず",4])
        qArray.append(["주먹밥","巻き寿司","おにぎり","おかず","おかゆ",2])
        qArray.append(["특히","聞き取り","悲しみ","特に","楽しい",3])
        
        qArray.append(["배","船着場","雨","チケット","船",4])
        qArray.append(["또","〜も","また","チケット","家",2])
        qArray.append(["댁","お宅","壁","家","土",1])
        qArray.append(["설날","週末","祝日","正月","平日",3])
        qArray.append(["외국","外国","イギリス","アメリカ","オランダ",1])
        
        //ここで問題を表示する！
        choiceQuiz()
        
        //★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
        //ここ、GOOGLE ADMOB
        
        let bannerView:GADBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        bannerView.adUnitID = "ca-app-pub-3198611449404323/4707284097"
        bannerView.delegate = self
        bannerView.rootViewController = self
        let gadRequest:GADRequest = GADRequest()
        gadRequest.testDevices = [kGADSimulatorID] // テスト時のみ
        bannerView.loadRequest(gadRequest)
        self.view.addSubview(bannerView)
        
        
        
        
    }

    func choiceQuiz() {
        
        print(qArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(qArray.count)))
        
        questionLabel.text = qArray[random][0] as! NSString as String

        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle((qArray[random][i+1] as! NSString) as NSString as String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    
    //答えのボタンを４つの中から選んだ時のアクション
    @IBAction func choiceAnswer(sender: UIButton) {
        
        sum++
        print("random \(random)")
        
        
        
        if timer.valid == true {
            
            //timerを破棄する.
            timer.invalidate()}
        
        else if qArray[random][5] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
            self.plusImage.hidden = false
            self.minusImage.hidden = true
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "hidden:", userInfo: nil, repeats: true)
        
        }
        else{
            self.plusImage.hidden = true
            self.minusImage.hidden = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "hidden:", userInfo: nil, repeats: true)
        
        }
        //解いた問題数の合計（sum）が予め設定していた問題数に達したら結果画面へ

//        if sum == questionNumber {
//            performSegueToResult()
//        }
//        else {
//            qArray.removeAtIndex(random)
//            choiceQuiz()
//        }

    }
    
    
    func hidden(){
        self.plusImage.hidden = true
        self.minusImage.hidden = true
        
        if sum == questionNumber {
            performSegueToResult()
        }
        else {
            qArray.removeAtIndex(random)
            choiceQuiz()
        }

        
        
    }
    
    
    
    
    
    //結果画面への遷移segue
    func performSegueToResult() {
        performSegueWithIdentifier("ResultView", sender: nil)
    }
    
    
    //データ受け渡してる？
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "ResultView") {
            let ResultView : ResultViewController = segue.destinationViewController as! ResultViewController


            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
