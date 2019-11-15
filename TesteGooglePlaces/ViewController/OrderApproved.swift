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
    
    func setupHeader(){
        headerLbl.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        headerLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerLbl.font = UIFont.init(name: "Helvetica Neue", size: 16)
        headerLbl.textAlignment = .left
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 20
        headerLbl.attributedText = NSAttributedString(string: "Delivery", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.addSubview(headerLbl)
        
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLbl.topAnchor.constraint(equalTo: view.topAnchor),
            headerLbl.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerLbl.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerLbl.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    func setupImage() {
        image.image = #imageLiteral(resourceName: "KikisDelivery")
        image.contentMode = .scaleAspectFit

        view.addSubview(image)

        image.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupMessage(){
        messageLbl.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        messageLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        messageLbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 16)
        messageLbl.textAlignment = .center
        messageLbl.text = "\(MessageResponse.message ?? "\n")"
        
        valueLbl.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        valueLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        valueLbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 16)
        valueLbl.textAlignment = .center
        valueLbl.text = "Valor total: R$ \(String(format:"%.2f", MessageResponse.value))"
        
        view.addSubview(messageLbl)
        view.addSubview(valueLbl)
        
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        valueLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLbl.bottomAnchor.constraint(equalTo: valueLbl.topAnchor, constant: -10),
            messageLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            messageLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            valueLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            valueLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            valueLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
}
