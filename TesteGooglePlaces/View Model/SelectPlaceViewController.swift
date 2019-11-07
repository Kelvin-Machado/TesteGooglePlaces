//
//  SelectPlaceViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 07/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class SelectPlaceViewController: UIViewController {
    
    let placesTable = SelectPlaceTableViewController()
    let textSearch = UITextField()
    
    let headerLabel = UILabel()
    let questionLabel = UILabel()
    let finalizeOrderButton = UIButton()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addChild(placesTable)
        view.addSubview(placesTable.tableView)
        
        setupHeader()
        setupQuestion()
        setupPlaces()
        setupFooterButton()

    }
    
    
    func setupHeader() {
        
        navigationController?.navigationBar.topItem?.title = " "
        
        headerLabel.backgroundColor = #colorLiteral(red: 0.4874656796, green: 0.395947814, blue: 1, alpha: 1)
        headerLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerLabel.font = UIFont.init(name: "Helvetica Neue", size: 16)
        headerLabel.textAlignment = .left
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 20
        headerLabel.attributedText = NSAttributedString(string: "Delivery", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        view.addSubview(headerLabel)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor),
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
        headerLabel.heightAnchor.constraint(equalToConstant: 35)])
    }
    
    func setupQuestion() {
        questionLabel.font = UIFont.init(name: "Helvetica Neue", size: 18)
        questionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .justified
        questionLabel.text = "Onde podemos encontrar o que você deseja?"
        
        view.addSubview(questionLabel)
        
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        questionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
        questionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        questionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)])
        
    }
    
    func setupPlaces() {
        textSearch.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textSearch.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let placeholder = NSAttributedString(string: "Busca", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textSearch.attributedPlaceholder = placeholder;
        
        textSearch.borderStyle = .roundedRect
        textSearch.layer.cornerRadius = 10
        textSearch.layer.borderWidth = 1
        textSearch.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textSearch.font = UIFont.init(name: "Helvetica Neue", size: 16)
        textSearch.autocorrectionType = .no
        textSearch.clipsToBounds = true
        
        view.addSubview(textSearch)
        
        textSearch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        textSearch.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
        textSearch.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
        textSearch.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
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
        let placeOrder = HomeViewControlle()
        navigationController?.pushViewController(placeOrder, animated: true)
    }
    
    
}
