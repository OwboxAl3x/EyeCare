//
//  EditController.swift
//  EyeCare
//
//  Created by Alejandro Garcia Vallecillo on 13/3/18.
//  Copyright © 2018 Alejandro Garcia Vallecillo. All rights reserved.
//

import UIKit
import Alamofire

class EditController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    @IBOutlet weak var tabla: UITableView!
    
    var searchController : UISearchController!
    
    var resultsController = UITableViewController()
    
    var jsonArray: NSArray?
    
    var tasks: Array<String> = []
    var tasksES: Array<String> = []
    var hours: Array<Int> = []
    var minutes: Array<Int> = []
    var seconds: Array<Int> = []
    var imagenes: Array<String> = []
    
    var tasksFiltered: Array<String> = []
    
    let preferredLanguage = NSLocale.preferredLanguages[0]
    
    var selectedTask:String = NSLocalizedString("DEFAULTTASK", comment: "TaskDefault")
    
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    // Funciones
    
    func creatingSearhBar() {
        
        self.searchController = UISearchController(searchResultsController: resultsController)
        self.tabla.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        
    }
    
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
                
                self.tabla.reloadData()
                
            }
            
        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if preferredLanguage == "es" {
            
            self.tasksFiltered = self.tasksES.filter { (task: String) -> Bool in
                
                if task.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                    
                    return true
                    
                } else{
                    
                    return false
                    
                }
                
            }
            
        } else {
            
            self.tasksFiltered = self.tasks.filter { (task: String) -> Bool in
                
                if task.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                    
                    return true
                    
                } else{
                    
                    return false
                    
                }
                
            }
            
        }
        
        self.resultsController.tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.tabla {
            
            if preferredLanguage == "es" {
                
                return tasksES.count
                
            } else {
                
                return tasks.count
                
            }
            
        } else {
            
            return tasksFiltered.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier:"TCell")
        
        if tableView == self.tabla {
        
            if preferredLanguage == "es" {
                
                cell.textLabel?.text = tasksES[indexPath.row]
                
            } else {
                
                cell.textLabel?.text = tasks[indexPath.row]
                
            }
            
        } else {
            
            cell.textLabel?.text = tasksFiltered[indexPath.row]
            
        }
        
        myActivityIndicator.stopAnimating()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.tabla {
        
            if preferredLanguage == "es" {
                
                self.selectedTask = tasksES[indexPath.row]
                
            } else {
                
                self.selectedTask = tasks[indexPath.row]
                
            }
            
        } else {
            
            self.selectedTask = tasksFiltered[indexPath.row]
            
        }
        
        self.searchController.isActive = false
        
        self.performSegue(withIdentifier: "ModifiedSegue", sender: selectedTask)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModifiedSegue" {
            
            let selected = sender as! String
            
            var pos: Int = 0
            
            if preferredLanguage == "es" {
                
                pos = tasksES.index(of: selected)!
                
            } else {
                
                pos = tasks.index(of: selected)!
                
            }
            
            if let destino = segue.destination as? ViewController{
                
                destino.task = self.selectedTask
                destino.hours = hours[pos]
                destino.minutes = minutes[pos]
                destino.seconds = seconds[pos]
                destino.imgTask = imagenes[pos]
                
            }
            
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Descargamos los datos de la API
        
        self.tabla.dataSource = self
        self.tabla.delegate = self
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        creatingSearhBar()
        
        // Position Activity Indicator in the center of the main view
        myActivityIndicator.center = view.center
        
        // If needed, you can prevent Acivity Indicator from hiding when stopAnimating() is called
        myActivityIndicator.hidesWhenStopped = true
        
        // Start Activity Indicator
        myActivityIndicator.startAnimating()
        
        view.addSubview(myActivityIndicator)
        
        downloadDatafromAPI()
        
        //sleep(4)
        
    }
    
}
