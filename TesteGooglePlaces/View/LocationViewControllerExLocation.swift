//
//  LocationViewControllerExLocation.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 12/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit
import MapKit

extension LocationViewController {
    //    MARK: - User Location
    
    func setupLocation() {
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        
        let location = locations.last! as CLLocation
        
        let lat = location.coordinate.latitude as NSNumber
        userCoords.self.userLatitude = lat.stringValue
        let lng = location.coordinate.longitude as NSNumber
        userCoords.self.userLongitude = lng.stringValue
        
        CLGeocoder().reverseGeocodeLocation(location) { (detalhesLocal, erro) in
            if erro == nil {
                var formattedLocation:String = ""
                if let dadosLocal = detalhesLocal?.first {
                    var locality = ""
                    if dadosLocal.locality != nil {
                        locality = dadosLocal.locality!
                        formattedLocation = locality + " - "
                    }
                    var postalCode = ""
                    if dadosLocal.postalCode != nil {
                        postalCode = dadosLocal.postalCode!
                        formattedLocation += postalCode
                    }
                    var subLocality = ""
                    if dadosLocal.subLocality != nil {
                        subLocality = dadosLocal.subLocality!
                        formattedLocation += " / " + subLocality
                    }
                    var subAdministrativeArea = ""
                    if dadosLocal.subAdministrativeArea != nil {
                        subAdministrativeArea = dadosLocal.subAdministrativeArea!
                        formattedLocation += " / " + subAdministrativeArea
                    }
                    var administrativeArea = ""
                    if dadosLocal.administrativeArea != nil {
                        administrativeArea = dadosLocal.administrativeArea!
                        formattedLocation += " / " + administrativeArea
                    }
                    var country = ""
                    if dadosLocal.country != nil {
                        country = dadosLocal.country!
                        formattedLocation += " / " + country
                    }
                }
                
                OrderResume.self.formattedUserLocation = formattedLocation
                self.locationManager.delegate = nil
                
                // After define user location and stop the location updates call POST
                if self.locationManager.delegate == nil {
                    self.checkoutPost()
                }
                
            }else{
                print(erro as Any)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != .authorizedWhenInUse {
            let alertaController = UIAlertController(title: "Permissão de localização" , message: "Necessária permissão para acesso à sua localização!! Por favor, habilite.", preferredStyle: .alert)
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir configurações", style: .default, handler: {(alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(configuracoes as URL)
                }
            })
            
            let acaoCancelar = UIAlertAction(title: "Cancelar", style:  .default, handler: nil)
            
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            
            present (alertaController, animated: true, completion: nil)
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error while updating location " + error.localizedDescription)
    }
}
