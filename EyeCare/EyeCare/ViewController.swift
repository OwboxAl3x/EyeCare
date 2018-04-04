//
//  ViewController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 12/3/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
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
            
            // Creamos el trigger de la notificación de aviso
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(timeRemaining), repeats: false)
            // Creamos el contenido de la notificación de aviso
            let contentTrigger = UNMutableNotificationContent()
            contentTrigger.title = "It's time to rest"
            contentTrigger.body = "Stop \(task) and rest"
            contentTrigger.sound = UNNotificationSound.default()
            // Creamos el objeto request
            let request = UNNotificationRequest(identifier: "outOfTime", content: contentTrigger, trigger: trigger)
            // Añadimos la request al centro de notificaciones
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            UNUserNotificationCenter.current().add(request) { (error) in
                if let error = error{
                    print("Se ha producido un error: \(error)")
                }
            }
            
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
        
        UNUserNotificationCenter.current().delegate = self
        
        self.imgActivity.image = UIImage(named: imgTask)
        self.imgActivity.layer.cornerRadius = self.imgActivity.bounds.size.width / 2
        self.imgActivity.layer.borderWidth = 4
        self.imgActivity.layer.borderColor = UIColor.white.cgColor
        
        lblTask.text = task
        
        timeRemaining = (hours*3600) + (minutes*60) + seconds
        
        lblCount.text = timeString()
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }

}

