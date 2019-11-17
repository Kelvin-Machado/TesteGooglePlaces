//
//  LoadingView.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 16/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import Foundation
import UIKit

class LoadingView {

    let uiView          :   UIView
    let message         :   String
    let messageLabel    =   UILabel()

    let loadingSV       =   UIStackView()
    let loadingView     =   UIView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)

    init(uiView: UIView, message: String) {
        self.uiView     =   uiView
        self.message    =   message
        self.setup()
    }

    func setup(){
        let viewHeight  = uiView.bounds.height
        let viewOrigin = uiView.bounds.origin
        let viewSize = uiView.bounds.size

        // Configuring the message label
        messageLabel.text             = message
        messageLabel.textColor        = UIColor.black
        messageLabel.textAlignment    = .center
        messageLabel.numberOfLines    = 3
        messageLabel.lineBreakMode    = .byWordWrapping
        messageLabel.font = UIFont.init(name: "HelveticaNeue-Bold", size: 18)

        // Creating stackView to center and align Label and Activity Indicator
        loadingSV.axis          = .vertical
        loadingSV.distribution  = .equalSpacing
        loadingSV.alignment     = .center
        loadingSV.addArrangedSubview(activityIndicator)
        loadingSV.addArrangedSubview(messageLabel)

        // Creating loadingView, this acts as a background for label and activityIndicator
        loadingView.frame        = CGRect(origin: viewOrigin, size: viewSize)
//        loadingView.center          = uiView.center
        loadingView.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 0.7959653253)
        loadingView.clipsToBounds   = true

        // Disabling auto constraints
        loadingSV.translatesAutoresizingMaskIntoConstraints = false

        // Adding subviews
        loadingView.addSubview(loadingSV)
        uiView.addSubview(loadingView)
        activityIndicator.startAnimating()

        // Views dictionary
        let views = [
            "loadingSV": loadingSV
        ]

        // Constraints for loadingSV
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[loadingSV(300)]-|", options: [], metrics: nil, views: views))
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(viewHeight / 3)-[loadingSV(50)]-|", options: [], metrics: nil, views: views))
    }

    // Call this method to hide loadingView
    func show() {
        loadingView.isHidden = false
    }

    // Call this method to show loadingView
    func hide(){
        loadingView.isHidden = true
    }

    // Call this method to check if loading view already exists
    func isHidden() -> Bool{
        if loadingView.isHidden == false{
            return false
        }
        else{
            return true
        }
    }
}

