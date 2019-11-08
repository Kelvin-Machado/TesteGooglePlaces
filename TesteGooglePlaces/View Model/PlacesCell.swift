//
//  PlacesCell.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 08/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {
    
//    MARK: - View
    var formattedPlace: UILabel?
    
    var formatedPlaceView: UILabel = {
        let placeLabel = UILabel()
        placeLabel.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.clipsToBounds = true
        return placeLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(formatedPlaceView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let formattedPlace = formattedPlace {
            formatedPlaceView.text = formattedPlace.text
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
