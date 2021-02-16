//
//  PhotoCell.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit
import SDWebImage // для ассинахронной загрузки и отправки фотографий в кэш - решение проблемы оффлайн-режима

class PhotoCell: UICollectionViewCell {
    
    static let reuseID = "photoCell"
    
    weak var viewModel: PhotoCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            descLabel.text = viewModel.description
            guard let url = URL(string: viewModel.imageUrl) else { return }
            photoImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    //MARK: - Create UI
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    let descLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.textColor = .textColor()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupConstraints()
    }
    
    //при переиспользовании ячейки картинка будет обнуляться
    override func prepareForReuse(){
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstraints(){
        
        addSubview(photoImageView)
        addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 7),
            descLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            descLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor)
        ])
    }
}
