//
//  EstimateAmountModel.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 12/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension EstimateAmountViewController {
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
            headerLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupContainer() {
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
        
        chosenProduct.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        chosenProduct.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        chosenProduct.font = UIFont.init(name: "HelveticaNeue-Bold", size: 16)
        chosenProduct.numberOfLines = 0
        chosenProduct.text = "\(OrderResume.self.product ?? "\n") \n"
        chosenProduct.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        choiceContainerView.addSubview(orderLocation)
        choiceContainerView.addSubview(orderAdress)
        choiceContainerView.addSubview(chosenProduct)
        containerView.addSubview(choiceContainerView)
        
        choiceContainerView.translatesAutoresizingMaskIntoConstraints = false
        orderLocation.translatesAutoresizingMaskIntoConstraints = false
        orderAdress.translatesAutoresizingMaskIntoConstraints = false
        chosenProduct.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            choiceContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            choiceContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            choiceContainerView.widthAnchor.constraint(equalToConstant: containerView.frame.width),
            
            orderLocation.topAnchor.constraint(equalTo: choiceContainerView.topAnchor, constant: 20),
            orderLocation.leftAnchor.constraint(equalTo: choiceContainerView.leftAnchor, constant: 20),
            orderLocation.rightAnchor.constraint(equalTo: choiceContainerView.rightAnchor, constant:-20),
            orderLocation.widthAnchor.constraint(equalToConstant: choiceContainerView.frame.width - 40),

            orderAdress.topAnchor.constraint(equalTo: orderLocation.bottomAnchor, constant: 10),
            orderAdress.leftAnchor.constraint(equalTo: choiceContainerView.leftAnchor, constant: 20),
            orderAdress.rightAnchor.constraint(equalTo: choiceContainerView.rightAnchor, constant: -20),
            orderAdress.widthAnchor.constraint(equalToConstant: choiceContainerView.frame.width - 40),
            
            chosenProduct.topAnchor.constraint(equalTo: orderAdress.bottomAnchor, constant: 20),
            chosenProduct.leftAnchor.constraint(equalTo: choiceContainerView.leftAnchor, constant: 20),
            chosenProduct.rightAnchor.constraint(equalTo: choiceContainerView.rightAnchor, constant: -20),
            chosenProduct.widthAnchor.constraint(equalToConstant: choiceContainerView.frame.width - 40),
        ])
        
    }
    
    func setupQuestion() {
        questionLabel.font = UIFont.init(name: "Helvetica Neue", size: 18)
        questionLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .justified
        questionLabel.text = "Quanto?"

        questionSubLabel.font = UIFont.init(name: "Helvetica Neue", size: 14)
        questionSubLabel.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        questionSubLabel.numberOfLines = 0
        questionSubLabel.textAlignment = .justified
        questionSubLabel.text = "Estime um valor para o seu pedido, fique tranquilo, o valor cobrado será o da nota fiscal"

        questionContainerView.addSubview(questionLabel)
        questionContainerView.addSubview(questionSubLabel)
        containerView.addSubview(questionContainerView)

        questionContainerView.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionSubLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            questionContainerView.topAnchor.constraint(equalTo: chosenProduct.bottomAnchor, constant: 20),
            questionContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            questionContainerView.widthAnchor.constraint(equalToConstant: containerView.frame.width),

            questionLabel.topAnchor.constraint(equalTo: questionContainerView.topAnchor, constant: 20),
            questionLabel.leftAnchor.constraint(equalTo: questionContainerView.leftAnchor, constant: 20),
            questionLabel.rightAnchor.constraint(equalTo: questionContainerView.rightAnchor, constant: -20),

            questionSubLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            questionSubLabel.leftAnchor.constraint(equalTo: questionContainerView.leftAnchor, constant: 20),
            questionSubLabel.rightAnchor.constraint(equalTo: questionContainerView.rightAnchor, constant: -20)])

    }

    func setupAmount() {
        textAmount.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textAmount.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        let placeholder = NSAttributedString(string: "R$ 0,00", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        textAmount.attributedPlaceholder = placeholder;

        textAmount.becomeFirstResponder()
        textAmount.borderStyle = .roundedRect
        textAmount.keyboardType = .numberPad
        textAmount.layer.cornerRadius = 10
        textAmount.layer.borderWidth = 1
        textAmount.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        textAmount.font = UIFont.init(name: "Helvetica Neue", size: 16)
        textAmount.clipsToBounds = true
        textAmount.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)

        containerView.addSubview(textAmount)

        textAmount.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textAmount.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            textAmount.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            textAmount.topAnchor.constraint(equalTo: questionSubLabel.bottomAnchor, constant: 10),
            textAmount.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString
            finalizeOrderButton.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            finalizeOrderButton.isEnabled = true
        }
        
        
    }
    
    func setupFooterButton() {
        
        finalizeOrderButton.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        finalizeOrderButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        finalizeOrderButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        finalizeOrderButton.setTitle("Continuar", for: .normal)
        finalizeOrderButton.layer.cornerRadius = 20
        finalizeOrderButton.isEnabled = false

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
        
        OrderResume.self.formattedPrice = textAmount.text
        
        let userLocationScreen = LocationViewController()
        navigationController?.pushViewController(userLocationScreen, animated: true)
    }
}
