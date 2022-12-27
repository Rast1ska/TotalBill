//
//  PersonsView.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 26.12.2022.
//

import UIKit

class PersonsView: UIView {
    
    var counter = 1
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let bacgroundGrayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.isEnabled = false
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 80)
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 60)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1"
        label.textColor = .black
        label.font = UIFont(name: "Avenir Next Bold", size: 48)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLable)
        addSubview(bacgroundGrayView)
        bacgroundGrayView.addSubview(minusButton)
        bacgroundGrayView.addSubview(plusButton)
        bacgroundGrayView.addSubview(counterLabel)
    }
    
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = String(counter)
        
        if counter == 1 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = String(counter)
        minusButton.isEnabled = true
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            
            bacgroundGrayView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            bacgroundGrayView.leftAnchor.constraint(equalTo: leftAnchor),
            bacgroundGrayView.rightAnchor.constraint(equalTo: rightAnchor),
            bacgroundGrayView.heightAnchor.constraint(equalToConstant: 100),
            
            minusButton.topAnchor.constraint(equalTo: bacgroundGrayView.topAnchor),
            minusButton.leftAnchor.constraint(equalTo: bacgroundGrayView.leftAnchor),
            minusButton.heightAnchor.constraint(equalTo: bacgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.topAnchor.constraint(equalTo: bacgroundGrayView.topAnchor),
            plusButton.rightAnchor.constraint(equalTo: bacgroundGrayView.rightAnchor),
            plusButton.heightAnchor.constraint(equalTo: bacgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            counterLabel.leftAnchor.constraint(equalTo: minusButton.rightAnchor),
            counterLabel.rightAnchor.constraint(equalTo: plusButton.leftAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: bacgroundGrayView.centerYAnchor)
        ])
    }
}



