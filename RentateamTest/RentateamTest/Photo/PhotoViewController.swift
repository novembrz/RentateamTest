//
//  PhotoViewController.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit
import SDWebImage

class PhotoViewController: UIViewController {
    
    var photo: UnsplashPhoto?
    
    private var photoView: PhotoView {
        guard let view = view as? PhotoView
        else {
            print("Could not create a view")
            return PhotoView()
        }
        return view
    }
    
    //MARK: - Initialize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgColor()
        updateUIInfo(photo: photo)
    }
    
    override func loadView() {
        view = PhotoView()
    }
    
    //MARK: - Update info
    
    private func updateUIInfo(photo: UnsplashPhoto?){
        guard let description = photo?.alt_description,
              let date = photo?.created_at,
              let imageUrl = photo?.urls["regular"] else { return }
        
        photoView.descLabel.text = description
        photoView.timeLabel.text = date
        guard let url = URL(string: imageUrl) else { return }
        photoView.photoImageView.sd_setImage(with: url, completed: nil)
    }

}
