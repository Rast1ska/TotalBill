//
//  PersonsView.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 26.12.2022.
//

import UIKit

class PersonsView: UIView {
    
    // MARK: -Private Properties
    var counter = 2
    
    // MARK: -Outlets
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Persons"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 14)
        return label
    }()
    
    private let backgroundGrayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.isEnabled = false
        button.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.3764705882, green: 0.4196078431, blue: 0.4901960784, alpha: 1)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        label.textColor = .black
        label.textAlignment = .center
        return label
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
        counterLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 2.6)
        
    }
    
    // MARK: -Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Private Methods
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLable)
        addSubview(backgroundGrayView)
        backgroundGrayView.addSubview(minusButton)
        backgroundGrayView.addSubview(plusButton)
        backgroundGrayView.addSubview(counterLabel)
    }
    
    // MARK: -@objc methods
    @objc func minusButtonTapped() {
        counter -= 1
        counterLabel.text = String(counter)
        
        if counter == 2 {
            minusButton.isEnabled = false
        }
    }
    
    @objc func plusButtonTapped() {
        counter += 1
        counterLabel.text = String(counter)
        minusButton.isEnabled = true
    }
    
}
    // MARK: -SetConstraints
extension PersonsView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            titleLable.heightAnchor.constraint(equalToConstant: 20),
            
            backgroundGrayView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            backgroundGrayView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundGrayView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundGrayView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            minusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            minusButton.leftAnchor.constraint(equalTo: backgroundGrayView.leftAnchor),
            minusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            minusButton.widthAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            
            plusButton.topAnchor.constraint(equalTo: backgroundGrayView.topAnchor),
            plusButton.rightAnchor.constraint(equalTo: backgroundGrayView.rightAnchor),
            plusButton.heightAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            plusButton.widthAnchor.constraint(equalTo: backgroundGrayView.heightAnchor),
            
            counterLabel.leftAnchor.constraint(equalTo: minusButton.rightAnchor),
            counterLabel.rightAnchor.constraint(equalTo: plusButton.leftAnchor),
            counterLabel.centerYAnchor.constraint(equalTo: backgroundGrayView.centerYAnchor)
        ])
    }
}



