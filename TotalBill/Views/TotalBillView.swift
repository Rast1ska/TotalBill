//
//  TotalBillView.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 25.12.2022.
//

import UIKit

class TotalBillView: UIView {
    
    // MARK: -Outlets
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        return label
    }()
    
    let subTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.tintColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
        return textField
    }()
    
    // MARK: -Override Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLable.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
        subTextField.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
    }
    
    // MARK: -Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Private methods
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLable)
        addSubview(subTextField)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            titleLable.heightAnchor.constraint(equalToConstant: 20),
            
            subTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            subTextField.leftAnchor.constraint(equalTo: leftAnchor),
            subTextField.rightAnchor.constraint(equalTo: rightAnchor),
            subTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
