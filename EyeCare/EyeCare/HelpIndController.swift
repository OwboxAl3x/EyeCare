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
    
    var consejos = [NSLocalizedString("CONSEJO1", comment: "Consejo1"),NSLocalizedString("CONSEJO2", comment: "Consejo2"),NSLocalizedString("CONSEJO3", comment: "Consejo3")]
    
    var faqs = [NSLocalizedString("FAQS1", comment: "Faqs1"), NSLocalizedString("FAQS2", comment: "Faqs2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblTitulo.text = titulo!
        
        if titulo! == "Tips" || titulo! == "Consejos" {
            
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
