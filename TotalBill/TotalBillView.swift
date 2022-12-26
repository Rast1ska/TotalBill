//
//  TotalBillView.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 25.12.2022.
//

import UIKit

class TotalBillView: UIView {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Bill"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    let subTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = UIFont(name: "Avenir Next Bold", size: 48)
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
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
        addSubview(subTextField)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            
            subTextField.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            subTextField.leftAnchor.constraint(equalTo: leftAnchor),
            subTextField.rightAnchor.constraint(equalTo: rightAnchor),
            subTextField.heightAnchor.constraint(equalToConstant: 100)
            
            
        ])
    }
}
