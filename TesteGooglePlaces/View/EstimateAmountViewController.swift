//
//  EstimateAmountViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 10/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class EstimateAmountViewController: UIViewController {
        
    //    MARK: - Properties
        
    let keyboardAwareBottomLayoutGuide: UILayoutGuide = UILayoutGuide()
    var keyboardTopAnchorConstraint: NSLayoutConstraint!
    
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
    var questionContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return view
    }()
    
    let headerLabel = UILabel()
        
    let orderLocation = UILabel()
    let orderAdress = UILabel()
    let chosenProduct = UILabel()
    
    let questionLabel = UILabel()
    let questionSubLabel = UILabel()
    let textAmount = UITextField()
    
    let finalizeOrderButton = UIButton()
    

        
    //    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        scrollView.contentInset = UIEdgeInsets (top: 35, left: 0, bottom: 0, right: 0)
        scrollView.contentOffset.y += -35
        
        setupKeyboard()
        setupNavBar()
        setupHeader()
        setupContainer()
        setupQuestion()
        setupAmount()
        setupFooterButton()
    }
    
    //MARK: - Setup keyboard
    func setupKeyboard(){
        self.view.addLayoutGuide(self.keyboardAwareBottomLayoutGuide)
        self.keyboardTopAnchorConstraint = self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: 0)
        self.keyboardTopAnchorConstraint.isActive = true
        self.keyboardAwareBottomLayoutGuide.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
         
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
     
    @objc func keyboardWillShow(notification: NSNotification) {
        updateKeyboardAwareBottomLayoutGuide(with: notification, hiding: false)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        updateKeyboardAwareBottomLayoutGuide(with: notification, hiding: true)
    }
    
    fileprivate func updateKeyboardAwareBottomLayoutGuide(with notification: NSNotification, hiding: Bool) {
        let userInfo = notification.userInfo

        let animationDuration = (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        let keyboardEndFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue

        let rawAnimationCurve = (userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uint32Value
        
        guard let animDuration = animationDuration,
            let keybrdEndFrame = keyboardEndFrame,
            let rawAnimCurve = rawAnimationCurve else {
                return
        }

        let convertedKeyboardEndFrame = view.convert(keybrdEndFrame, from: view.window)

        let rawAnimCurveAdjusted = UInt(rawAnimCurve << 16)
        let animationCurve = UIView.AnimationOptions(rawValue: rawAnimCurveAdjusted)

        self.keyboardTopAnchorConstraint.constant = hiding ? 0 : convertedKeyboardEndFrame.size.height

        self.view.setNeedsLayout()

        UIView.animate(withDuration: animDuration, delay: 0.0, options: [.beginFromCurrentState, animationCurve], animations: {
            self.view.layoutIfNeeded()
        }, completion: { success in
             
        })
    }
}
