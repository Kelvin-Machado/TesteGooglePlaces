//
//  SelectPlaceTableViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 07/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension SelectPlaceViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return resultsArray.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath) as! PlacesCell
        let place = self.resultsArray[indexPath.row]
        cell.formatedPlaceView.text = "\(place["name"] as! String) \(place["formatted_address"] as! String)"
        
         return cell
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         let place = self.resultsArray[indexPath.row]
        OrderResume.local = "\(place["name"] as! String)"
        OrderResume.adress = "\(place["formatted_address"] as! String)"
        print(place["geometry"] as Any)
        
        var location: [String : AnyObject]
        var coords: [String : AnyObject]
        location = place["geometry"]! as! [String : AnyObject]
        coords = location["location"]! as! [String : AnyObject]
        var lat:NSNumber!, lng:NSNumber!
        for _ in coords {
            lat = coords["lat"]! as? NSNumber
            lng = coords["lng"]! as? NSNumber
        }
        storeCoords.self.storeLatitude = lat.stringValue
        storeCoords.self.storeLongitude = lng.stringValue
        finalizeOrderButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        finalizeOrderButton.isEnabled = true
     }

     
     @objc func searchPlaceFromGoogle(_ textField:UITextField) {
         
         if let searchQuery = textField.text {
             var strGoogleApi = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(searchQuery)&key=AIzaSyAG8_j_vEdxCilZACDkQiFyGIUzLFGM7VA"
             strGoogleApi = strGoogleApi.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
             
             var urlRequest = URLRequest(url: URL(string: strGoogleApi)!)
             urlRequest.httpMethod = "GET"
             let task = URLSession.shared.dataTask(with: urlRequest) {(data, resopnse, error) in
                     if error == nil {
                         
                         if let responseData = data {
                         let jsonDict = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                             
                             if let dict = jsonDict as? Dictionary<String, AnyObject>{
                                 
                                 if let results = dict["results"] as? [Dictionary<String, AnyObject>] {
//                                    print("json == \(results)")
                                     self.resultsArray.removeAll()
                                     for dct in results {
                                         self.resultsArray.append(dct)
                                     }
                                     
                                     DispatchQueue.main.async {
                                        
                                         self.placesTableView.reloadData()
                                 }
                                 
                             }
                         }
                         
                     }
                 } else {
                     //Erro de API
                 }
             }
             task.resume()
        }
        
    }

}
