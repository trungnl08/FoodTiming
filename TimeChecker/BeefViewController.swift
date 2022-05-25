//
//  BeefViewController.swift
//  TimeChecker
//
//  Created by Trung on 5/25/22.
//

import UIKit

class BeefViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    let allTime = ["rare":120,"mediumRare":200, "medium":250,"well":300]
    var secondRemain = 0
    var timer = Timer()
    @IBAction func handle(_ sender: UIButton) {
        timer.invalidate()
        let timing = sender.currentTitle!
        secondRemain = allTime[timing]!
       timer = Timer.scheduledTimer(timeInterval: 1,target: self, selector:#selector(updateTimer),userInfo: nil,repeats:true )
    }
    @objc func updateTimer(){
        if secondRemain > 0 {
            print("\(secondRemain) seconds")
            titleLabel.text = "\(secondRemain) seconds"
            secondRemain -= 1
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
