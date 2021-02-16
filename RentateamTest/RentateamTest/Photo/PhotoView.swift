//
//  PhotoView.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit

class PhotoView: UIView {
    
    //MARK: - Create UI
    
    var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var descLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .textColor()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    var timeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textColor()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    //MARK: - Initialize

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .bgColor()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Setup Constraints
    
    private func setupConstraints(){
        addSubview(photoImageView)
        addSubview(timeLabel)
        addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: descLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            photoImageView.leadingAnchor.constraint(equalTo: descLabel.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: descLabel.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
