//
//  HangukViewController.swift
//  hanguk
//
//  Created by Karin on 2015/10/25.
//  Copyright © 2015年 Karin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questionArray  = [AnyObject]()
    
    var correctAnswer:Int = 0
    var falseAnswer:Int = 0
    
    @IBOutlet var questionTextView:UITableView!
    
    @IBOutlet var button1:UIButton!
    @IBOutlet var button2:UIButton!
    @IBOutlet var button3:UIButton!
    
    
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
            questionArray.append(qArray[index])
            qArray.removeAtIndex(index)
        
        }
        
        func choiceQuiz() {
            questionTextView.text = questionArray[0][0] as! String
            //選択肢のボタン
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    
    }


}

