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
    
    var tasks = ["Programming", "Reading", "Studing"]
    
    var selectedTask:String = "Programming"
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerTasks.delegate = self
        pickerTasks.dataSource = self
        
    }
    
}
