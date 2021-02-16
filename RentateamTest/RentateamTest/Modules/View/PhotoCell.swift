//
//  PhotoCell.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseID = "photoCell"
    
    weak var viewModel: PhotoCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            descLabel.text = viewModel.description
            guard let url = URL(string: viewModel.imageUrl) else { return }
        }
    }
//    
//    var unsplashPhoto: UnsplashPhoto!{ //unwrap тк если вызовется данный метод, то фотография точно уже пришла с сервера
//        didSet {
//            let photoUrl = unsplashPhoto.urls["regular"]
//            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else { return }
//            photoImageView.sd_setImage(with: url, completed: nil)
//        }
//    }
    
    //MARK: - Create UI
    
    var cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .bgColor()
        return view
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 7
        return imageView
    }()
    
    let descLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .textColor()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    //MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Constraints
    
    private func setupConstraints(){
        
        //addSubview(cellView)
        addSubview(photoImageView)
        addSubview(descLabel)
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 7),
            descLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            descLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
