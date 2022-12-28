//
//  TipsCollectionViewCell.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 27.12.2022.
//

import UIKit

class TipsCollectionViewCell: UICollectionViewCell {
    
    // MARK: -Outlets
    let procentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // MARK: -Override Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        procentLabel.font = UIFont(name: "Avenir Next Bold", size: frame.height / 3.4)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                layer.borderWidth = 3
                layer.borderColor = #colorLiteral(red: 0.5647058824, green: 0.1529411765, blue: 0.7450980392, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    // MARK: -Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Private Methods
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.9442129731, green: 0.9491841197, blue: 0.9404790998, alpha: 1)
        layer.cornerRadius = 10
        
        addSubview(procentLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            procentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            procentLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
