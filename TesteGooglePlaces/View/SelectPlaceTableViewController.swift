//
//  SelectPlaceTableViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 07/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class SelectPlaceTableViewController: UITableViewController {
    
    
    var resultsArray:[Dictionary<String, AnyObject>] = Array()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }
    
    func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 44
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath)
        
        if let labelPlaceName = cell.contentView.viewWithTag(102) as? UILabel {
            let place = self.resultsArray[indexPath.row]
            labelPlaceName.text = "\(place["name"] as! String) \(place["formatted_address"] as! String)"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let place = self.resultsArray[indexPath.row]
        OrderResume.local = "\(place["name"] as! String) \(place["formatted_address"] as! String)"
        
        let placeOrder = HomeViewControlle()
        navigationController?.pushViewController(placeOrder, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
