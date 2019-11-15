//
//  OrderApproved.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 15/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class OrderApproved: UIViewController {

    //    MARK: - Views
    let headerLbl = UILabel()
    let messageLbl = UILabel()
    let valueLbl = UILabel()
    let image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        setupNavBar()
        setupHeader()
        setupImage()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.setupMessage()
        }
    }
}
