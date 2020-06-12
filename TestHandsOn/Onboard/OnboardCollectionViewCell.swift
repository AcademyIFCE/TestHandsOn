//
//  OnboardCollectionViewCell.swift
//  testeClass
//
//  Created by Yuri on 11/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import UIKit

class OnboardCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "OnboardCell"
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var buttonAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        constructView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No need for that")
    }
    
    func setup(onboard: Onboard, action: (() -> Void)?) {
        self.titleLabel.text = onboard.title
        self.descriptionLabel.text = onboard.subtitle
        self.button.setTitle(onboard.buttonTitle, for: .normal)
        self.buttonAction = action
    }
    
    private func constructView() {
        self.addSubview(titleLabel)
        self.addSubview(button)
        self.addSubview(descriptionLabel)
        
        button.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 320),
            
            descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18),
            
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -380)
        ])
    }
    
    @objc private func buttonWasTapped() {
        buttonAction?()
    }
}
