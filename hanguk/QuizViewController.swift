//
//  QuizViewController.swift
//  hanguk
//
//  Created by Karin on 2015/10/25.
//  Copyright © 2015年 Karin. All rights reserved.
//



import UIKit

class QuizViewController: UIViewController {
    //クイズの問題を入れる配列
    var quizArray  = [AnyObject]()
    
    //出題数
    var questionNumber:Int = 10
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //クイズの問題を表示するtextview
    @IBOutlet var questionTextView:UITextView!
    
//    @IBOutlet var choiceButtons: Array<UIButton>!
    @IBOutlet var Button1:UIButton!
    @IBOutlet var Button2:UIButton!
    @IBOutlet var Button3:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var qArray = [AnyObject]()
        
        //クイズの問題　30問分の型の用意
        qArray.append(["6人前","육인분","여섯인분","일곱인분","유인",1])
        qArray.append(["8枚","팔츤","여덟장","팔층","여덟면",2])
        qArray.append(["2個","이것","이개","두개","둘캐",3])
        qArray.append(["9台","","","","",4])
        qArray.append(["5階","","","","",3])
        
        qArray.append(["10月27日","","","","",])
        qArray.append(["4泊","","","","",])
        qArray.append(["봄이(　　　)꽃이 핍니다　春が来れば花が咲きます。","오기 전에","오다","오면","오로",3])
        qArray.append(["(　　　)오십시요","오른쯕으로","압으면","앞어","앞으로",4])
        qArray.append(["","","","","",])
        
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        
        
        //問題をシャッフルしてquizarrayにいれる！格納する！！
        while (qArray.count > 0){
            let index = Int(arc4random_uniform(UInt32(qArray.count)))
            quizArray.append(qArray[index])
            qArray.removeAtIndex(index)
        
        }
        choiceQuiz()
    }
    
        func choiceQuiz() {
            print(quizArray.count)
            questionTextView.text = quizArray[0][0] as! String
            //選択肢のボタン
            
        
            //選択肢のボタンに選択肢の文　テキストを！
            Button1.setTitle( quizArray [0][1] as? String, forState: .Normal)
            Button2.setTitle( quizArray [0][2] as? String, forState: .Normal)
            Button3.setTitle( quizArray [0][3] as? String, forState: .Normal)

        }
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destinationViewController as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}


}
