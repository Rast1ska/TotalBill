//
//  ViewController.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 25.12.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        return label
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    let descriptionLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter the invoice amount and click \"Calculate\""
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 15)
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let totalBillView = TotalBillView()
    let personsView = PersonsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9960784316, green: 0.9960785508, blue: 0.9960785508, alpha: 1)
        
        view.addSubview(titleLable)
        view.addSubview(logoImageView)
        view.addSubview(descriptionLable)
        view.addSubview(totalBillView)
        view.addSubview(personsView)
        view.addSubview(calculateButton)
    }
}

extension MainViewController {
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 10),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            descriptionLable.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            descriptionLable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionLable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            totalBillView.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 10),
            totalBillView.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            totalBillView.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            totalBillView.heightAnchor.constraint(equalToConstant: 130),
            
            personsView.topAnchor.constraint(equalTo: totalBillView.bottomAnchor, constant: 10),
            personsView.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            personsView.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            personsView.heightAnchor.constraint(equalToConstant: 130),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.leftAnchor.constraint(equalTo: descriptionLable.leftAnchor),
            calculateButton.rightAnchor.constraint(equalTo: descriptionLable.rightAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

