//
//  OrderViewModel.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 12/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension OrderViewController {
    func setupHeader() {
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
               headerLabel.heightAnchor.constraint(equalToConstant: 35),
           ])
       }
       
       func setupChosenPlace() {
           
           orderLocation.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           orderLocation.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           orderLocation.font = UIFont.init(name: "HelveticaNeue-Bold", size: 16)
           orderLocation.text = OrderResume.self.local
           
           orderAdress.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           orderAdress.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
           orderAdress.font = UIFont.init(name: "Helvetica Neue", size: 14)
           orderAdress.numberOfLines = 0
           orderAdress.text = "\(OrderResume.self.adress ?? "\n") \n"
           orderAdress.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
           
           view.addSubview(orderLocation)
           view.addSubview(orderAdress)
           
           orderLocation.translatesAutoresizingMaskIntoConstraints = false
           orderAdress.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               orderLocation.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
               orderLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
               orderLocation.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-20),
               orderLocation.widthAnchor.constraint(equalToConstant: view.frame.width - 40),

               orderAdress.topAnchor.constraint(equalTo: orderLocation.bottomAnchor, constant: 10),
               orderAdress.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
               orderAdress.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
               orderAdress.widthAnchor.constraint(equalToConstant: view.frame.width - 40)
           ])
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
           questionSubLabel.text = "Descreva direitinho o que você deseja dessa loja que um shipper vai até lá comprar pra você 🙂"
           
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
           textProduct.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           textProduct.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           
           let placeholder = NSAttributedString(string: "Produto da Loja", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
           textProduct.attributedPlaceholder = placeholder;
           
           textProduct.becomeFirstResponder()
           textProduct.borderStyle = .roundedRect
           textProduct.layer.cornerRadius = 10
           textProduct.layer.borderWidth = 1
           textProduct.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
           textProduct.font = UIFont.init(name: "Helvetica Neue", size: 16)
           textProduct.clipsToBounds = true
           
           view.addSubview(textProduct)
           
           textProduct.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               textProduct.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
               textProduct.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
               textProduct.topAnchor.constraint(equalTo: questionSubLabel.bottomAnchor, constant: 20),
               textProduct.heightAnchor.constraint(equalToConstant: 40)])
       }
       
       func setupFooterButton() {
           
           finalizeOrderButton.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
           finalizeOrderButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           finalizeOrderButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
           finalizeOrderButton.setTitle("Continuar", for: .normal)
           finalizeOrderButton.layer.cornerRadius = 20

           finalizeOrderButton.addTarget(self, action: #selector(finalizeButtonTapped), for: .touchUpInside)
           
           view.addSubview(finalizeOrderButton)
           
           finalizeOrderButton.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               finalizeOrderButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
               finalizeOrderButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
               finalizeOrderButton.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: -10),
               finalizeOrderButton.heightAnchor.constraint(equalToConstant: 40)])
       }
       
       @objc func finalizeButtonTapped(){
           OrderResume.self.product = textProduct.text
           let amount = EstimateAmountViewController()
           navigationController?.pushViewController(amount, animated: true)
       }
}
