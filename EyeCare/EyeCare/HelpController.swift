//
//  HelpController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 4/4/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit

class HelpController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ayudas = ["Consejos", "Ejemplo1", "Ejemplo2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ayudas.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier:"DCell")

        cell.textLabel?.text = ayudas[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fila = indexPath.row
        self.performSegue(withIdentifier: "helpSegue", sender: fila)
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "helpSegue"
        {
            
            let selected = sender as! Int
            
            let objHelpInd:HelpIndController = segue.destination as! HelpIndController
            
            objHelpInd.titulo = ayudas[selected]
            
        }
        
    }

}
