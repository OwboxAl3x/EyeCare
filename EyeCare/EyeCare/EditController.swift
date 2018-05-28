//
//  EditController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 13/3/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit

class EditController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerTasks: UIPickerView!
    
    var tasks = ["Programming", "Reading", "Studing", "Playing Games", "Test"]
    
    var selectedTask:String = NSLocalizedString("DEFAULTTASK", comment: "TaskDefault")
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return tasks.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return tasks[row]
    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.selectedTask = tasks[row]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destino = segue.destination as? ViewController{
            
            destino.task = selectedTask
            
            if selectedTask == "Programming" || selectedTask == "Programando" {
                
                destino.hours = 1
                destino.minutes = 0
                destino.seconds = 0
                destino.imgTask = "imgPrograming.jpeg"
                
            } else if selectedTask == "Reading" {
                
                destino.hours = 1
                destino.minutes = 30
                destino.seconds = 0
                destino.imgTask = "imgReading.jpeg"
                
            }else if selectedTask == "Studing" {
                
                destino.hours = 1
                destino.minutes = 0
                destino.seconds = 0
                destino.imgTask = "imgStudying.jpeg"
                
            }else if selectedTask == "Playing Games" {
                
                destino.hours = 1
                destino.minutes = 30
                destino.seconds = 0
                destino.imgTask = "imgGaming.jpeg"
                
            }else if selectedTask == "Test" {
                
                destino.hours = 0
                destino.minutes = 0
                destino.seconds = 20
                destino.imgTask = "imgStudying.jpeg"
                
            }
            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerTasks.delegate = self
        pickerTasks.dataSource = self
        
    }
    
}
