//
//  HangukViewController.swift
//  hanguk
//
//  Created by Karin on 2015/10/25.
//  Copyright © 2015年 Karin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizArray  = [AnyObject]()
    
    var correctAnswer:Int = 0
    var falseAnswer:Int = 0
    
    @IBOutlet var questionTextView:UITextView!
    
    @IBOutlet var Button1:UIButton!
    @IBOutlet var Button2:UIButton!
    @IBOutlet var Button3:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var qArray = [AnyObject]()
        
        //クイズの問題　30問分の型の用意
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
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        qArray.append(["","","","","",])
        //
        
        
        while (qArray.count > 0){
            let index = Int(arc4random_uniform(UInt32(qArray.count)))
            quizArray.append(qArray[index])
            qArray.removeAtIndex(index)
        
        }
        choiceQuiz()
    }
    
        func choiceQuiz() {
            questionTextView.text = quizArray[0][0] as! String
            //選択肢のボタン
            
            Button1.setTitle( quizArray [0][1] as? String, forState: .Normal)
            Button2.setTitle( quizArray [0][2] as? String, forState: .Normal)
            Button3.setTitle( quizArray [0][3] as? String, forState: .Normal)

        }
        
    @IBAction func choiceAnswer(sender: UIButton){
        if quizArray[0][4] as! Int == sender.tag{
        
        correctAnswer++
        }
        
        quizArray.removeAtIndex(0)
        if quizArray.count == 0{
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
        }
    func performSegueToResult(){
        
        
        
    }
        
    
    
        
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    
    }

}


