//
//  HelpIndController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 4/4/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit

class HelpIndController: UIViewController {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var titulo:String?
    
    var consejos = ["1. Try not to sit too close to the screen or, in the case of reading or studying, keep the text at a distance so as not to force excessive vision.","2. It is important to maintain good lighting in the environment where the task is performed.","3. Maintaining a good posture also helps to avoid visual fatigue."]
    
    var faqs = ["1. Why do my eyes sting?\n\nThe visual exhaustion produced by an excess of acommodation in near vision can cause symptoms of itching or stinging.", "2. When I'm two hours in front of the computer, my eyes get red.\n\nThe redness of the eyes may be associated with other symptoms such as itching and caused by rubbing the eyes with the hands."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblTitulo.text = titulo!
        
        if titulo! == "Tips" {
            
            for i in 0...consejos.count-1{
                
                textView.text = textView.text + consejos[i] + "\n\n\n"
                
            }
            
        }else if titulo! == "FAQs" {
            
            for i in 0...faqs.count-1{
                
                textView.text = textView.text + faqs[i] + "\n\n\n\n"
                
            }
            
        }
        
    }

}
