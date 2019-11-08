//
//  OrderViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 08/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    let headerLabel = UILabel()
    
    let orderLocation = UILabel()
    let orderAdress = UILabel()
    
    let questionLabel = UILabel()
    let questionSubLabel = UILabel()
    let textSearch = UITextField()
    let finalizeOrderButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.topItem?.title = " "
        setupHeader()
        setupChosenPlace()
        setupQuestion()
        setupProduct()
        setupFooterButton()
    }
    
    func setupHeader() {
        headerLabel.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        headerLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerLabel.font = UIFont.init(name: "Helvetica Neue", size: 16)
        headerLabel.textAlignment = .left
        
        orderLocation.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        orderLocation.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        orderLocation.font = UIFont.init(name: "Helvetica Neue", size: 16)
        orderLocation.text = OrderResume.self.local
        orderAdress.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        orderAdress.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        orderAdress.font = UIFont.init(name: "Helvetica Neue", size: 14)
        orderAdress.text = OrderResume.self.adress
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 20
        headerLabel.attributedText = NSAttributedString(string: "Delivery", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.addSubview(headerLabel)
        view.addSubview(orderLocation)
        view.addSubview(orderAdress)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        orderLocation.translatesAutoresizingMaskIntoConstraints = false
        orderAdress.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor),
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
        headerLabel.heightAnchor.constraint(equalToConstant: 35),
        
        orderLocation.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
        orderLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        orderLocation.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-20),
        orderLocation.widthAnchor.constraint(equalToConstant: view.frame.width - 40),

        orderAdress.topAnchor.constraint(equalTo: orderLocation.bottomAnchor),
        orderAdress.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        orderAdress.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        orderAdress.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
        ])
    }
    
    func setupChosenPlace() {
        
    }
    
    func setupQuestion() {
        questionLabel.font = UIFont.init(name: "Helvetica Neue", size: 18)
        questionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .justified
        questionLabel.text = "O que você deseja?"
        
        view.addSubview(questionLabel)
        
        questionSubLabel.font = UIFont.init(name: "Helvetica Neue", size: 14)
        questionSubLabel.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        questionSubLabel.numberOfLines = 0
        questionSubLabel.textAlignment = .justified
        questionSubLabel.text = "Descreva direitinho o que você deseja dessa loja que um shipper vai até lá comprar pra você :)"
        
        view.addSubview(questionSubLabel)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionSubLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: orderAdress.bottomAnchor, constant: 20),
        questionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        questionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        
        questionSubLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
        questionSubLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        questionSubLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)])
        
    }
    
    func setupProduct() {
        textSearch.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textSearch.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let placeholder = NSAttributedString(string: "Produto da Loja", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textSearch.attributedPlaceholder = placeholder;
        
        textSearch.borderStyle = .roundedRect
        textSearch.layer.cornerRadius = 10
        textSearch.layer.borderWidth = 1
        textSearch.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textSearch.font = UIFont.init(name: "Helvetica Neue", size: 16)
        textSearch.clipsToBounds = true
        
        view.addSubview(textSearch)
        
        textSearch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        textSearch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        textSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        textSearch.topAnchor.constraint(equalTo: questionSubLabel.bottomAnchor, constant: 20),
        textSearch.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    func setupFooterButton() {
        
        finalizeOrderButton.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        finalizeOrderButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        finalizeOrderButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        finalizeOrderButton.setTitle("Finalizar pedido", for: .normal)

        finalizeOrderButton.addTarget(self, action: #selector(finalizeButtonTapped), for: .touchUpInside)
        
        view.addSubview(finalizeOrderButton)
        
        finalizeOrderButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        finalizeOrderButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        finalizeOrderButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        finalizeOrderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        finalizeOrderButton.heightAnchor.constraint(equalToConstant: 35)])
    }
    
    @objc func finalizeButtonTapped(){
        let placeOrder = HomeViewController()
        navigationController?.pushViewController(placeOrder, animated: true)
    }

}

