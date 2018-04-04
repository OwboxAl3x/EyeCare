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
    
    var consejos = ["1. Procura no sentarte muy cerca de la pantalla o, en el caso de leer o estudiar, mantaner el texto a cierta distancia para minimizar el daño en la vista.","2. ","3. "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblTitulo.text = titulo!
        
        if titulo! == "Consejos" {
            
            for i in 0...consejos.count-1{
                
                textView.text = textView.text + consejos[i] + "\n\n"
                
            }
            
        }
        
    }

}
