//
//  OrangeViewController.swift
//  TimeChecker
//
//  Created by Trung on 5/21/22.
//

import UIKit

class OrangeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    let allTime = ["Soft":150,"Medium":240, "Hard":350]
    var totalTime = 0
    var timer = Timer()
    var secondpassed = 0
    @IBAction func handleClick(_ sender: UIButton) {
        timer.invalidate()
        let timing = sender.currentTitle!
        totalTime = allTime[timing]!
        progress.progress = 0.0
        secondpassed = 0
        titleLabel.text = timing
       timer = Timer.scheduledTimer(timeInterval: 1,target: self, selector:#selector(updateTimer),userInfo: nil,repeats:true )
    }
    @objc func updateTimer(){
        if secondpassed < totalTime {
            secondpassed += 1
            titleLabel.text = String( totalTime - secondpassed)

            progress.progress = Float(secondpassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
