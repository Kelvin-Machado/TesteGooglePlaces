//
//  ActivityIndicator.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 16/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit
import Foundation

class ActivityIndicatorView
{
    var view: UIView!

var activityIndicator: UIActivityIndicatorView!

var title: String!

init(title: String, center: CGPoint, width: CGFloat = 200.0, height: CGFloat = 50.0)
{
    self.title = title

    let x = center.x - width/2.0
    let y = center.y - height/2.0

    self.view = UIView(frame: CGRect(x: x, y: y + 150, width: width, height: height))
    self.view.backgroundColor = UIColor(#colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 0.7959653253))
    self.view.layer.cornerRadius = 10

    self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    self.activityIndicator.color = UIColor.black
    self.activityIndicator.hidesWhenStopped = false

    let titleLabel = UILabel(frame: CGRect(x: 60, y: 0, width: 200, height: 50))
    titleLabel.text = title
    titleLabel.textColor = UIColor.black

    self.view.addSubview(self.activityIndicator)
    self.view.addSubview(titleLabel)
}

func getViewActivityIndicator() -> UIView
{
    return self.view
}

func startAnimating()
{
    self.activityIndicator.startAnimating()
    UIApplication.shared.beginIgnoringInteractionEvents()
}

func stopAnimating()
{
    self.activityIndicator.stopAnimating()
    UIApplication.shared.endIgnoringInteractionEvents()

    self.view.removeFromSuperview()
}
//end
}
