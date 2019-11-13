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
    let distaceKMLbl = UILabel()
    let valueDeliveryLbl = UILabel()
    
    let estimatedValueLbl = UILabel()
    
    let totalValueLbl = UILabel()

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
        
        setupNavBar()
        setupLocation()
        
        setupHeader()
        setupContainer()
        setupValue()
        
        setupFooterButton()
        
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
        checkoutPost()
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
