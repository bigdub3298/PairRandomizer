//
//  PairListTableViewController.swift
//  PairRandomizer
//
//  Created by Wesley Austin on 10/20/16.
//  Copyright © 2016 Wesley Austin. All rights reserved.
//

import UIKit

class PairListTableViewController: UITableViewController {

    var people = PersonController.sharedController.people
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        let sections = Double(people.count) / 2.0
        
        return Int(ceil(sections))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (people.count / 2) == section && (people.count % 2) == 1 {
            return 1
        } else {
            return 2
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        let index = (indexPath.section * 2) + indexPath.row
        
        let person = people[index]
        
        cell.textLabel?.text = person.name

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group \(section + 1)"
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */


    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let addPersonAlert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let textField = addPersonAlert.textFields?[0] else { return }
            
            let name = textField.text ?? ""
            
            PersonController.sharedController.addPerson(name: name)
            
            self.people = PersonController.sharedController.people
            
            self.tableView.reloadData()
        }
        
        addPersonAlert.addTextField(configurationHandler: nil)
        
        addPersonAlert.addAction(cancelAction)
        addPersonAlert.addAction(saveAction)
        
        self.present(addPersonAlert, animated: true, completion: nil)
    }
}
