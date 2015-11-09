//
//  ResultViewController.swift
//  hanguk
//
//  Created by Karin on 2015/10/28.
//  Copyright © 2015年 Karin. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ResultViewController: UIViewController {
//, GADInterstitialDelegate, UIAlertViewDelegate {

    var correctAnswer:Int = 0
//     var interstitial: GADInterstitial?
    
    @IBOutlet var backButton : UIButton!
    
//    var sum:Int = 0
    @IBOutlet var resultlabel : UILabel!
//    @IBOutlet var sumLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        

        resultlabel.text = "\(correctAnswer)"

        
    }
    
    @IBAction func buckButton(sender:UIButton){
//        if (interstitial!.isReady) {
//            interstitial!.presentFromRootViewController(self)
//        }
//        else{}
        performSegueToTop()
    
    }
//    
//    private func loadInterstitial() {
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3198611449404323/5169785694")
//        interstitial!.delegate = self
//        
//        // Request test ads on devices you specify. Your test device ID is printed to the console when
//        // an ad request is made. GADInterstitial automatically returns test ads when running on a
//        // simulator.
//        interstitial!.loadRequest(GADRequest())
//    }
//    
    
    
    //結果画面への遷移segue
    func performSegueToTop() {
        performSegueWithIdentifier("topView", sender: nil)
    }
    
    
//    func interstitialDidFailToReceiveAdWithError (
//        interstitial: GADInterstitial,
//        error: GADRequestError) {
//            print("interstitialDidFailToReceiveAdWithError: %@" + error.localizedDescription)
//    }
//    
//    func interstitialDidDismissScreen (interstitial: GADInterstitial) {
//        print("interstitialDidDismissScreen")
//       
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   
}
