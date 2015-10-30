//
//  ResultViewController.swift
//  hanguk
//
//  Created by Karin on 2015/10/28.
//  Copyright © 2015年 Karin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer:Int = 0
    
//    var questionNumber:Int = 0
    @IBOutlet var resultlabel : UILabel!
//    @IBOutlet var sumLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        resultlabel.text = "\(correctAnswer)"
//        sumLabel.text = "\(questionNumber)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
