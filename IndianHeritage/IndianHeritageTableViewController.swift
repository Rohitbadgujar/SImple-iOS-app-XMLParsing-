//
//  IndianHeritageTableViewController.swift
//  IndianHeritage
//
//  Created by Rohit on 12/16/1397 AP.
//  Copyright © 1397 Rohit. All rights reserved.
//

import UIKit

class IndianHeritageTableViewController: UITableViewController {
 var placeDetails	 : Place!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Indian Heritage"
        placeDetails = Place(fromContentOfXML: "heritage.xml");
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }	

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return placeDetails.count();
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Configure the cell...
        let heritageData = placeDetails.heritageData(index: indexPath.row);
        cell.textLabel!.text = heritageData.name;
        cell.detailTextLabel!.text = heritageData.getAddress();
        cell.imageView!.image = UIImage(named: heritageData.image);
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SelectedHeritageViewController
        
        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
    destination.heritageData =  placeDetails.heritageData(index:indexPath!.row);

    }
    

}
