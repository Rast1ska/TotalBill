//
//  TipsView.swift
//  TotalBill
//
//  Created by Ильфат Салахов on 27.12.2022.
//

import UIKit

class TipsView: UIView {
    
    // MARK: -Oublic Properties
    var tipsCount = 0
    
    // MARK: -Private Properties
    private let tipsArray = ["0%", "10%", "15%", "20%"]
    
    // MARK: -Outlets
    private let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tips"
        label.textColor = #colorLiteral(red: 0.1792383194, green: 0.2248822749, blue: 0.2836511731, alpha: 1)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: -Override Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
        setDelegates()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLable.font = UIFont(name: "Avenir Next", size: frame.width / 26.7)
    }
    
    // MARK: -Required init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Private Methods
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLable)
        addSubview(collectionView)
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

    // MARK: -CollectionView Data Source
extension TipsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TipsCollectionViewCell else { return UICollectionViewCell() }
        cell.procentLabel.text = tipsArray[indexPath.row]
        
        return cell
    }
}

    // MARK: -CollectionView Delegate
extension TipsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1: tipsCount = 10
        case 2: tipsCount = 15
        case 3: tipsCount = 20
        default: tipsCount = 0
        }
    }
}

    // MARK: -CollectionView DelegateFlowLayout
extension TipsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.8,
               height: collectionView.frame.width / 4.8)
    }
}
    // MARK: -SetConstraints
extension TipsView {
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: topAnchor),
            titleLable.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            titleLable.heightAnchor.constraint(equalToConstant: 20),
            
            collectionView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 2),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
