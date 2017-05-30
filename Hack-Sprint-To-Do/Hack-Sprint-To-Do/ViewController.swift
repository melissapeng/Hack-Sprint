//
//  ViewController.swift
//  Hack-Sprint-To-Do
//
//  Created by Michael Yu on 5/17/17.
//  Copyright © 2017 Michael Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    var items: [String] = []
    var times: [Int] = []
    
    
    
    @IBOutlet weak var toMenu: UIButton!
    
    @IBOutlet weak var listTV: UITableView!

    
    @IBAction func addItem(_ sender: AnyObject) {
        alert()
    }
    
    
    let defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTV.dataSource = self;
        listTV.delegate = self;
        
        

        //memory
        if(defaults.object(forKey: "listDefaults") != nil){
            var tempArray: [String] = []
            tempArray = defaults.object(forKey: "listDefaults") as! [String]
            items = tempArray       //assigns items to the defaults array
            
        }
        
        if(defaults.object(forKey: "timeDefaults") != nil){
            var tempArray: [Int] = []
            tempArray = defaults.object(forKey: "timeDefaults") as! [Int]
            times = tempArray       //assigns items to the defaults array
            
        }
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listItem") as! ItemTableViewCell
        
        cell.itemLabel.text = items[indexPath.row]
        cell.timeLabel.text = String(times[indexPath.row])
        cell.itemLabel.font = UIFont(name: "Helvetica Neue", size: 14)
        return cell
    }
    
    func alert (){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        alert.addTextField{
            (textfield) in
            textfield.placeholder = "Enter task"
        }
        
        alert.addTextField{
            (textfield) in
            textfield.placeholder = "Enter Time Alloted"
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){
            (action) in
            
        }
        let add = UIAlertAction(title: "Add", style: .default){
            (action) in
            
            //add a new text in your TV
            var tempTextField = alert.textFields![0]
            
            //check if they actually wrote a task
            if(tempTextField.text == nil){
                tempTextField.text = "I'm dumb I put nothing"
            }
            
            self.items.append(tempTextField.text!)
        
            var tempArray = self.defaults.object(forKey: "listDefaults") as? [String] ?? [String]()
            tempArray.append(tempTextField.text!)
            
            self.defaults.set(tempArray, forKey: "listDefaults")
            
            
            //set the time alloted
            var timeTextField = alert.textFields![1];
            
            //check if they actually wrote a time
            if(timeTextField.text == nil){
                timeTextField.text = String(5)
            }
            
            self.times.append(Int(timeTextField.text!)!)
            self.listTV.reloadData()

            
            //set the defaults storage to encompass the new time
            var tempTimeArray = self.defaults.object(forKey: "timeDefaults") as? [Int] ?? [Int]()
            tempTimeArray.append(Int(timeTextField.text!)!)
            self.defaults.set(tempTimeArray, forKey: "timeDefaults")
            
            
        }
        
        alert.addAction(cancel)
        
        alert.addAction(add)
        
        
        
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        defaults.set(items, forKey: "listDefaults")        //updates the storage
        
        times.remove(at: indexPath.row)
        defaults.set(times, forKey: "timeDefaults")
        
        
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let start = UITableViewRowAction(style: .normal, title: "Start") { action, index in
            print("start task button tapped")
            
            //segue into next screen
            self.performSegue(withIdentifier: "toLoadingVC", sender: nil)

            
        }
        start.backgroundColor = .blue
        
        let cancel = UITableViewRowAction(style: .normal, title: "Cancel") { action, index in
            print("cancel button tapped")
            
            
            //delete the items & times
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.defaults.set(self.items, forKey: "listDefaults")        //updates the storage
            
            self.times.remove(at: indexPath.row)
            self.defaults.set(self.times, forKey: "timeDefaults")
            
            
        }
        cancel.backgroundColor = .green
        
        return [cancel, start]
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
