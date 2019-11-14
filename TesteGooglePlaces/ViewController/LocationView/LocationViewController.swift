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
    
    var paymentContainerView:UIView = {
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
    
    let userLocalLbl = UILabel()
    let userLocal = UILabel()
    
    let paymentBtn = UIButton()
    let ccInfoLbl = UILabel()
    let ccLogoImg = UIImageView()
    let symbolLbl = UILabel()
    let linha = UILabel()
    
    
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.setupValue()
            self.setupLocal()
            self.setupPaymentCC()
        }
        
    }
    
}
