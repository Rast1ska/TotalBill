//
//  ViewController.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 25.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: -Outlets
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = .black
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let descriptionLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Next Bold", size: 14)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let totalBillView = TotalBillView()
    
    private let personsView = PersonsView()
    
    private let tipsView = TipsView()
    
    // MARK: -Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        addTap()
    }
    
    // MARK: -Private Methods
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9960784316, green: 0.9960785508, blue: 0.9960785508, alpha: 1)
        
        titleLable.font = UIFont(name: "Avenir Next Bold", size: view.frame.height * 0.046)
        calculateButton.titleLabel?.font = UIFont(name: "Futura", size: view.frame.width / 20)
        
        view.addSubview(titleLable)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLable)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
        view.addSubview(tipsView)
    }
    
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: -@objc methods
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc func calculateButtonTapped() {
        guard let totalBill = totalBillView.subTextField.text,
              let totalBillInt = Int(totalBill) else {
            descriptionLable.text = "Enter total bill"
            descriptionLable.textColor = .red
            return
        }
        
        let sum = totalBillInt + totalBillInt * tipsView.tipsCount / 100
        
        let result = sum / personsView.counter
        descriptionLable.text = "\(result) per person"
    }
}

    // MARK: -SetConstraints
extension MainViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            descriptionLable.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 5),
            totalBillView.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            totalBillView.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            totalBillView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.14),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 5),
            personsView.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            personsView.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            personsView.heightAnchor.constraint(equalTo: totalBillView.heightAnchor),
            
            tipsView.topAnchor.constraint(equalTo: personsView.bottomAnchor, constant: 5),
            tipsView.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            tipsView.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            tipsView.heightAnchor.constraint(equalTo: totalBillView.heightAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: tipsView.bottomAnchor, constant: 10),
            calculateButton.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            calculateButton.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            calculateButton.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 0.1),
            calculateButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
}

