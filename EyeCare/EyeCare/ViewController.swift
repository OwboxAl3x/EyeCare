//
//  ViewController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 12/3/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgActivity: UIImageView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblStart: UIButton!
    @IBOutlet weak var lblTask: UILabel!
    
    var task:String = "Programing"
    var imgTask:String = "imgPrograming.jpeg"
    
    var hours:Int = 2
    var minutes:Int = 0
    var seconds:Int = 0
    
    var timeRemaining:Int = 0
    
    var timer = Timer()
    var isTimerRun = false
    
    @IBAction func btnStart(_ sender: UIButton) {
        
        timeRemaining = (hours*3600) + (minutes*60) + seconds
        
        if isTimerRun == false {
            
            isTimerRun = true
            runTimer()
            lblStart.setTitle("Stop", for: .normal)
            
        }else {
            
            isTimerRun = false
            timer.invalidate()
            lblStart.setTitle("Start", for: .normal)
            lblCount.text = timeString()
            
        }
        
    }
    
    func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        
        if timeRemaining < 1 {
            
            timer.invalidate()

        } else {
            
            timeRemaining -= 1
            lblCount.text = timeString()
            
        }
        
    }
    
    func timeString() -> String {
        
        let hours = Int(timeRemaining) / 3600
        let minutes = Int(timeRemaining) / 60 % 60
        let seconds = Int(timeRemaining) % 60
        
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Entrando en el viewDidLoad de ViewControler con task: \(task)")
        
        self.imgActivity.image = UIImage(named: imgTask)
        self.imgActivity.layer.cornerRadius = self.imgActivity.bounds.size.width / 2
        self.imgActivity.layer.borderWidth = 4
        self.imgActivity.layer.borderColor = UIColor.white.cgColor
        
        lblTask.text = task
        
        timeRemaining = (hours*3600) + (minutes*60) + seconds
        
        lblCount.text = timeString()
        
    }

}

