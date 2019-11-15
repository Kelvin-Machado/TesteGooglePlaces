//
//  CreditCardViewController.swift
//  TesteGooglePlaces
//
//  Created by Kelvin Batista Machado on 12/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController, UITextFieldDelegate {
    
        
    //    MARK: - Properties
        
    let keyboardAwareBottomLayoutGuide: UILayoutGuide = UILayoutGuide()
    var keyboardTopAnchorConstraint: NSLayoutConstraint!
    
    lazy var contentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 150)
    
    static var defaults = UserDefaults.standard
    static var existeCartao = false
    
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
    
    var creditCardContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    var numberCCContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    
    let headerLabel = UILabel()
    
    let titleLbl = UILabel()
    let creditCardImg = UIImageView()
    
    let credidCardNumberLbl = UILabel()
    let credidCardNumberTxt = UITextField()
    let line = UILabel()
    
    let nameCreditCardLbl = UILabel()
    let nameCreditCardTxt = UITextField()
    
    let expiryDateLbl = UILabel()
    let expiryDateTxt = UITextField()
    
    let cvvLbl = UILabel()
    let cvvTxt = UITextField()
    
    let saveBtn = UIButton()
    
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
        checkForSavedData()
        setupHeader()
        
        setupTitle()
        setupCreditCardNumber()
        setupNameCreditCard()
        setupExpiryDate()
        setupCVV()
        setupSaveBtn()
        

    }
    
//    MARK:- Functions
    
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
    
    func setupTitle(){
        titleLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titleLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        titleLbl.font = UIFont.init(name: "HelveticaNeue-Bold", size: 20)
        titleLbl.text = "Adicionar cartão"
        
        creditCardImg.image = #imageLiteral(resourceName: "mastercard")
        creditCardImg.contentMode = .scaleAspectFit
        
        line.text = ""
        line.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        creditCardContainerView.addSubview(titleLbl)
        creditCardContainerView.addSubview(creditCardImg)
        creditCardContainerView.addSubview(line)
        containerView.addSubview(creditCardContainerView)
        
        creditCardContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        creditCardImg.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            creditCardContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            creditCardContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            creditCardContainerView.widthAnchor.constraint(equalToConstant: containerView.frame.width),
            
            titleLbl.bottomAnchor.constraint(equalTo: creditCardImg.bottomAnchor),
            titleLbl.leftAnchor.constraint(equalTo: creditCardContainerView.leftAnchor, constant: 20),
            
            creditCardImg.topAnchor.constraint(equalTo: creditCardContainerView.topAnchor, constant: 10),
            creditCardImg.rightAnchor.constraint(equalTo: creditCardContainerView.rightAnchor, constant: 20),
            creditCardImg.heightAnchor.constraint(equalToConstant: 40),
            
            line.topAnchor.constraint(equalTo: creditCardImg.bottomAnchor, constant: 20),
            line.leftAnchor.constraint(equalTo: creditCardContainerView.leftAnchor, constant: 20),
            line.rightAnchor.constraint(equalTo: creditCardContainerView.rightAnchor, constant: -20),
            line.widthAnchor.constraint(equalToConstant: creditCardContainerView.frame.width - 40)
        ])
        
        
    }
    func setupCreditCardNumber(){
        credidCardNumberLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        credidCardNumberLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        credidCardNumberLbl.font = UIFont.init(name: "Helvetica Neue", size: 13)
        credidCardNumberLbl.text = "Número do Cartão"
        credidCardNumberLbl.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        credidCardNumberTxt.delegate = self
        credidCardNumberTxt.keyboardType = .numberPad
        credidCardNumberTxt.font = UIFont(name:"HelveticaNeue-Bold", size: 12)
        credidCardNumberTxt.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        credidCardNumberTxt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        credidCardNumberTxt.attributedPlaceholder = NSAttributedString(string: "Número do cartão",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

        credidCardNumberTxt.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)
        
        self.credidCardNumberTxt.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)

        setupCreditCardNumberConstraints()
    }
    
    func setupCreditCardNumberConstraints() {
        containerView.addSubview(credidCardNumberLbl)
        containerView.addSubview(credidCardNumberTxt)
        
        credidCardNumberLbl.translatesAutoresizingMaskIntoConstraints = false
        credidCardNumberTxt.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            credidCardNumberLbl.topAnchor.constraint(equalTo: line.topAnchor, constant: 30),
            credidCardNumberLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            credidCardNumberLbl.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) - 50),
            credidCardNumberLbl.bottomAnchor.constraint(equalTo: credidCardNumberTxt.bottomAnchor),
            
            credidCardNumberTxt.topAnchor.constraint(equalTo: line.topAnchor, constant: 30),
            credidCardNumberTxt.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            credidCardNumberTxt.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) + 10)
        ])
    }
    
    @objc func didChangeText(textField:UITextField) {
        textField.text = self.modifyCreditCardString(creditCardString: textField.text!)
    }
    
    func setupNameCreditCard(){
        nameCreditCardLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameCreditCardLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameCreditCardLbl.font = UIFont.init(name: "Helvetica Neue", size: 13)
        nameCreditCardLbl.text = "Nome do titular"
        nameCreditCardLbl.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        nameCreditCardTxt.delegate = self
        nameCreditCardTxt.keyboardType = .default
        nameCreditCardTxt.font = UIFont(name:"Helvetica Neue", size: 13)
        nameCreditCardTxt.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameCreditCardTxt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nameCreditCardTxt.attributedPlaceholder = NSAttributedString(string: "Nome do titular",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])
        nameCreditCardTxt.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        setupNameCreditCardConstraints()
    }
    func setupNameCreditCardConstraints() {
        
        containerView.addSubview(nameCreditCardLbl)
        containerView.addSubview(nameCreditCardTxt)
        
        nameCreditCardLbl.translatesAutoresizingMaskIntoConstraints = false
        nameCreditCardTxt.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameCreditCardLbl.topAnchor.constraint(equalTo: credidCardNumberLbl.bottomAnchor, constant: 20),
            nameCreditCardLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            nameCreditCardLbl.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) - 50),
            nameCreditCardLbl.bottomAnchor.constraint(equalTo: nameCreditCardTxt.bottomAnchor),
            
            nameCreditCardTxt.topAnchor.constraint(equalTo: credidCardNumberTxt.bottomAnchor, constant: 20),
            nameCreditCardTxt.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            nameCreditCardTxt.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) + 10)
        ])
    }
    
    func setupExpiryDate(){
        expiryDateLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        expiryDateLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        expiryDateLbl.font = UIFont.init(name: "Helvetica Neue", size: 13)
        expiryDateLbl.text = "Validade"
        expiryDateLbl.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        expiryDateTxt.delegate = self
        expiryDateTxt.keyboardType = .numberPad
        expiryDateTxt.font = UIFont(name:"HelveticaNeue-Bold", size: 12)
        expiryDateTxt.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        expiryDateTxt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        expiryDateTxt.attributedPlaceholder = NSAttributedString(string: "MM/AA",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

        expiryDateTxt.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        setupExpiryDateConstraints()
    }
    
    func setupExpiryDateConstraints() {
        containerView.addSubview(expiryDateLbl)
        containerView.addSubview(expiryDateTxt)
        
        expiryDateLbl.translatesAutoresizingMaskIntoConstraints = false
        expiryDateTxt.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            expiryDateLbl.topAnchor.constraint(equalTo: nameCreditCardLbl.bottomAnchor, constant: 20),
            expiryDateLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            expiryDateLbl.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) - 50),
            expiryDateLbl.bottomAnchor.constraint(equalTo: expiryDateTxt.bottomAnchor),
            
            expiryDateTxt.topAnchor.constraint(equalTo: nameCreditCardTxt.bottomAnchor, constant: 20),
            expiryDateTxt.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            expiryDateTxt.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) + 10)
        ])
    }
    
    func setupCVV(){
        cvvLbl.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cvvLbl.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cvvLbl.font = UIFont.init(name: "Helvetica Neue", size: 13)
        cvvLbl.text = "CVV"
        cvvLbl.addLine(position: .LINE_POSITION_BOTTOM, color: .lightGray, width: 1.0)
        
        cvvTxt.delegate = self
        cvvTxt.keyboardType = .numberPad
        cvvTxt.font = UIFont(name:"HelveticaNeue-Bold", size: 12)
        cvvTxt.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cvvTxt.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        cvvTxt.attributedPlaceholder = NSAttributedString(string: "CVV",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])
        cvvTxt.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        setupCVVConstraints()
    }
    
    func setupCVVConstraints() {
        containerView.addSubview(cvvLbl)
        containerView.addSubview(cvvTxt)
        
        cvvLbl.translatesAutoresizingMaskIntoConstraints = false
        cvvTxt.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cvvLbl.topAnchor.constraint(equalTo: expiryDateLbl.bottomAnchor, constant: 20),
            cvvLbl.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            cvvLbl.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) - 50),
            cvvLbl.bottomAnchor.constraint(equalTo: cvvTxt.bottomAnchor),
            
            cvvTxt.topAnchor.constraint(equalTo: expiryDateTxt.bottomAnchor, constant: 20),
            cvvTxt.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            cvvTxt.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) + 10)
        ])
    }
    
    func setupSaveBtn() {
        
        saveBtn.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        saveBtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        saveBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        saveBtn.setTitle("SALVAR", for: .normal)
        saveBtn.layer.cornerRadius = 20

        saveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
        
        view.addSubview(saveBtn)
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            saveBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveBtn.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: -10),
            saveBtn.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    @objc func saveBtnTapped(){
        CreditCardData.cardNumber = credidCardNumberTxt.text
        CreditCardData.holderName = nameCreditCardTxt.text
        CreditCardData.expiryDate = expiryDateTxt.text
        CreditCardData.cvv = Int(cvvTxt.text ?? "")
        CreditCardViewController.saveData()
        navigationController?.popViewController(animated: true)
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
