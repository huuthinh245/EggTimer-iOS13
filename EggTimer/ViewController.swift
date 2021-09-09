//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var lblEgg: UILabel!
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var count = 0;
    var total: Int = 0
    var timer: Timer?
    @IBAction func handlePress(sender: UIButton) {
        timer?.invalidate()
        let title: String = sender.currentTitle!
        total = eggTimes[title]!
        lblEgg.text = title
        progress.progress = 0.0
        count = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if count < total {
            print("\(count) s");
                        count += 1
            let percent = Float(count) / Float(total)
            progress.progress = percent
        }else {
            timer?.invalidate()
            lblEgg.text = "Done"
        }
    }
}
