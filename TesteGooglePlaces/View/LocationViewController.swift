//
//  LocationViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 10/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController, CLLocationManagerDelegate {
    
        
    //    MARK: - Properties
    
    var locationManager: CLLocationManager!
    
    lazy var contentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 150)
    
    
    //    MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.frame.size = contentViewSize
        return view
    }()
    
    var choiceContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    var valueContainerView:UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    var userLocationContainerView:UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    let headerLabel = UILabel()
        
    let orderLocation = UILabel()
    let orderAdress = UILabel()
    let chosenProduct = UILabel()
    
    let distanceLbl = UILabel()
    let distanceKMLbl = UILabel()
    
    let valueDeliveryLbl = UILabel()
    let valueDelivery = UILabel()
    
    let estimatedValueLbl = UILabel()
    let estimatedValue = UILabel()
    
    let totalValueLbl = UILabel()
    let totalValue = UILabel()

    let userLocationLbl = UILabel()
    let userLocationInfoLbl = UILabel()
    
    let pagamentoBtn = UIButton()
    let creditCardInfo = UILabel()
    let finalizeOrderButton = UIButton()

        
    //    MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.contentInset = UIEdgeInsets (top: 35, left: 0, bottom: 0, right: 0)
        scrollView.contentOffset.y += -35
        
        setupLocation()
        setupNavBar()
        setupHeader()
        setupContainer()
        setupFooterButton()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.checkoutPost()
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.setupValue()
        }
        
    }
    
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
    
    func setupValue() {
        distanceLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        distanceLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        distanceLbl.font = UIFont.init(name: "Helvetica Neue", size: 14)
        distanceLbl.numberOfLines = 0
        distanceLbl.text = "Distância: "
        
        distanceKMLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        distanceKMLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        distanceKMLbl.font = UIFont.init(name: "Helvetica Neue", size: 14)
        distanceKMLbl.numberOfLines = 0
        distanceKMLbl.text = "\(String(format:"%.2f", ValueResponse.distance))KM"
     
        valueDeliveryLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        valueDeliveryLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        valueDeliveryLbl.font = UIFont.init(name: "Helvetica Neue", size: 14)
        valueDeliveryLbl.numberOfLines = 0
        valueDeliveryLbl.text = "Valor de Entrega:"
         
        valueDelivery.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        valueDelivery.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        valueDelivery.font = UIFont.init(name: "Helvetica Neue", size: 14)
        valueDelivery.numberOfLines = 0
        valueDelivery.text = "R$ \(String(format:"%.2f", ValueResponse.fee_value))"
        
        estimatedValueLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        estimatedValueLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        estimatedValueLbl.font = UIFont.init(name: "Helvetica Neue", size: 14)
        estimatedValueLbl.numberOfLines = 0
        estimatedValueLbl.text = "Valor Estimado:"
         
        estimatedValue.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        estimatedValue.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        estimatedValue.font = UIFont.init(name: "Helvetica Neue", size: 14)
        estimatedValue.numberOfLines = 0
        estimatedValue.text = "R$ \(String(format:"%.2f", ValueResponse.product_value))"
        
        totalValueLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        totalValueLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totalValueLbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 14)
        totalValueLbl.numberOfLines = 0
        totalValueLbl.text = "Valor Total: \n"
        totalValueLbl.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        totalValue.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        totalValue.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        totalValue.font = UIFont.init(name: "HelveticaNeue-Bold", size: 14)
        totalValue.numberOfLines = 0
        totalValue.text = "R$ \(String(format:"%.2f", ValueResponse.total_value)) \n"
        totalValue.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        valueContainerView.addSubview(distanceLbl)
        valueContainerView.addSubview(distanceKMLbl)
        valueContainerView.addSubview(valueDeliveryLbl)
        valueContainerView.addSubview(valueDelivery)
        valueContainerView.addSubview(estimatedValueLbl)
        valueContainerView.addSubview(estimatedValue)
        valueContainerView.addSubview(totalValue)
        valueContainerView.addSubview(totalValueLbl)
        containerView.addSubview(valueContainerView)
        
        setupValueContraints()
    }
    
    func setupValueContraints() {
        valueContainerView.translatesAutoresizingMaskIntoConstraints = false
        distanceLbl.translatesAutoresizingMaskIntoConstraints = false
        distanceKMLbl.translatesAutoresizingMaskIntoConstraints = false
        valueDeliveryLbl.translatesAutoresizingMaskIntoConstraints = false
        valueDelivery.translatesAutoresizingMaskIntoConstraints = false
        estimatedValueLbl.translatesAutoresizingMaskIntoConstraints = false
        estimatedValue.translatesAutoresizingMaskIntoConstraints = false
        totalValue.translatesAutoresizingMaskIntoConstraints = false
        totalValueLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            valueContainerView.topAnchor.constraint(equalTo: chosenProduct.bottomAnchor),
            valueContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            valueContainerView.widthAnchor.constraint(equalToConstant: containerView.frame.width),
            
            distanceLbl.topAnchor.constraint(equalTo: valueContainerView.topAnchor, constant: 20),
            distanceLbl.leftAnchor.constraint(equalTo: valueContainerView.leftAnchor, constant: 40),
            distanceKMLbl.topAnchor.constraint(equalTo: valueContainerView.topAnchor, constant: 20),
            distanceKMLbl.rightAnchor.constraint(equalTo: valueContainerView.rightAnchor, constant:-40),
            
            valueDeliveryLbl.topAnchor.constraint(equalTo: distanceLbl.bottomAnchor, constant: 5),
            valueDeliveryLbl.leftAnchor.constraint(equalTo: valueContainerView.leftAnchor, constant: 40),
            valueDelivery.topAnchor.constraint(equalTo: distanceKMLbl.bottomAnchor, constant: 5),
            valueDelivery.rightAnchor.constraint(equalTo: valueContainerView.rightAnchor, constant:-40),
            
            estimatedValueLbl.topAnchor.constraint(equalTo: valueDeliveryLbl.bottomAnchor, constant: 5),
            estimatedValueLbl.leftAnchor.constraint(equalTo: valueContainerView.leftAnchor, constant: 40),
            estimatedValue.topAnchor.constraint(equalTo: valueDelivery.bottomAnchor, constant: 5),
            estimatedValue.rightAnchor.constraint(equalTo: valueContainerView.rightAnchor, constant:-40),
            
            totalValueLbl.topAnchor.constraint(equalTo: estimatedValueLbl.bottomAnchor, constant: 5),
            totalValueLbl.leftAnchor.constraint(equalTo: valueContainerView.leftAnchor, constant: 40),
            totalValueLbl.rightAnchor.constraint(equalTo: totalValue.leftAnchor),
            totalValue.topAnchor.constraint(equalTo: estimatedValue.bottomAnchor, constant: 5),
            totalValue.rightAnchor.constraint(equalTo: valueContainerView.rightAnchor, constant:-40),
            totalValue.leftAnchor.constraint(equalTo: totalValueLbl.rightAnchor)
        ])

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
            finalizeOrderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            finalizeOrderButton.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    @objc func finalizeButtonTapped(){
        let finalize = HomeViewController()
        navigationController?.pushViewController(finalize, animated: true)
    }
    
}
