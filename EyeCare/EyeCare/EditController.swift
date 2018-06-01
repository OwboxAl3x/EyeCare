//
//  EditController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 13/3/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit
import Alamofire

class EditController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerTasks: UIPickerView!
    
    var jsonArray: NSArray?
    
    var tasks: Array<String> = []
    var tasksES: Array<String> = []
    var hours: Array<Int> = []
    var minutes: Array<Int> = []
    var seconds: Array<Int> = []
    var imagenes: Array<String> = []
    
    var taskSelected: Int = 0
    
    let preferredLanguage = NSLocale.preferredLanguages[0]
    
    var selectedTask:String = NSLocalizedString("DEFAULTTASK", comment: "TaskDefault")
    
    // Funciones
    
    func downloadDatafromAPI(){
        
        Alamofire.request("http://private-ea06c-eyecareapi.apiary-mock.com/taskList") .responseJSON { response in
            
            if let JSON = response.result.value{
                
                self.jsonArray = JSON as? NSArray
                
                for item in self.jsonArray! as! [NSDictionary]{
                    
                    let name = item["name"] as? String
                    let nameES = item["nameES"] as? String
                    let hours = item["hours"] as? Int
                    let minutes = item["minutes"] as? Int
                    let seconds = item["seconds"] as? Int
                    let img = item["imgTask"] as? String
                    
                    self.tasks.append(name!)
                    self.tasksES.append(nameES!)
                    self.hours.append(hours!)
                    self.minutes.append(minutes!)
                    self.seconds.append(seconds!)
                    self.imagenes.append(img!)
                    
                }
                
                self.pickerTasks.reloadAllComponents()
                
            }
            
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if preferredLanguage == "es" {
            
            return tasksES.count
            
        } else {
            
            return tasks.count
            
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if preferredLanguage == "es" {
            
            return tasksES[row]
            
        } else {
        
            return tasks[row]
            
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if preferredLanguage == "es" {
            
            self.selectedTask = tasksES[row]
            self.taskSelected = row
            
        } else {
        
            self.selectedTask = tasks[row]
            self.taskSelected = row
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destino = segue.destination as? ViewController{
            
            destino.task = self.selectedTask
            destino.hours = hours[taskSelected]
            destino.minutes = minutes[taskSelected]
            destino.seconds = seconds[taskSelected]
            destino.imgTask = imagenes[taskSelected]
            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerTasks.delegate = self
        pickerTasks.dataSource = self
        
        // Descargamos los datos de la API
        
        downloadDatafromAPI()
        
    }
    
}
