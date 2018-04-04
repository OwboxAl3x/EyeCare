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
    
    var tasks = ["Programing", "Reading", "Studing", "Test"]
    
    var selectedTask:String = "Programing"
    
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
            
            if selectedTask == "Programing" {
                
                destino.hours = 2
                destino.imgTask = "imgPrograming.jpeg"
                
            } else if selectedTask == "Reading" {
                
                destino.hours = 2
                destino.minutes = 30
                destino.imgTask = "imgReading.jpeg"
                
            }else if selectedTask == "Studing" {
                
                destino.hours = 1
                destino.minutes = 30
                destino.imgTask = "imgStudying.jpeg"
                
            }else if selectedTask == "Test" {
                
                destino.hours = 0
                destino.minutes = 5
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
