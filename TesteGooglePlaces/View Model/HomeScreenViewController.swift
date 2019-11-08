//
//  HomeScreenViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 07/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let headerLabel = UILabel()
    let textLabel = UILabel()
    let deliveryButton = UIButton()
    let footerLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        setupText()
        setupNavBar()
        setupDeliveryButton()
    }
    
    
    func setupText() {

        headerLabel.font = UIFont.init(name: "Helvetica Neue", size: 30)
        headerLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerLabel.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        headerLabel.text = "Google place App"

        textLabel.font = UIFont.init(name: "Helvetica Neue", size: 16)
        textLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textLabel.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .justified
        textLabel.text = "Duis maximus neque metus, quis tincidunt justo scelerisque at. Phasellus vel felis vel sem efficitur faucibus. Integer mattis vehicula ipsum, id interdum lorem feugiat vitae."
        
        footerLabel.font = UIFont.init(name: "Helvetica Neue", size: 16)
        footerLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        footerLabel.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        footerLabel.textAlignment = .center
        footerLabel.text = "Versão 0.1"
        
        view.addSubview(headerLabel)
        view.addSubview(textLabel)
        view.addSubview(footerLabel)
        
        setTextsConstraints()
        
    }
    
    func setupDeliveryButton() {
        
        deliveryButton.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        deliveryButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        deliveryButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        deliveryButton.setTitle("Delivery", for: .normal)
        deliveryButton.layer.cornerRadius = 20

        deliveryButton.addTarget(self, action: #selector(deliveryButtonTapped), for: .touchUpInside)
        
        view.addSubview(deliveryButton)
        setDeliveryButtonConstraints()
    }
    
    @objc func deliveryButtonTapped(){
        let placeOrder = SelectPlaceViewController()
        navigationController?.pushViewController(placeOrder, animated: true)
    }
    
    func setTextsConstraints () {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        headerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        headerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        headerLabel.heightAnchor.constraint(equalToConstant: 35),
        headerLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
        
        textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5),
        textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        textLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        
        footerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        footerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        footerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)])
    }
    
    func setDeliveryButtonConstraints () {
        deliveryButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        deliveryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        deliveryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        deliveryButton.heightAnchor.constraint(equalToConstant: 40),
        deliveryButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)])
    }

}
