//
//  ViewController.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit

class PhotoFeedController: UIViewController {
    
    private var photoFeedView: PhotoFeedView {
        guard let view = view as? PhotoFeedView
        else {
            print("Could not create a view")
            return PhotoFeedView()
        }
        return view
    }
    
    //MARK: - Initialize

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgColor()
        setupDelegateAndDataSource()
        setupNavigationBar()
        setupSearchBar()
    }
    
    override func loadView() {
        view = PhotoFeedView()
    }
    
    //MARK: - Setup Collection View
    
    private func setupDelegateAndDataSource() {
        photoFeedView.collectionView.delegate = self
        photoFeedView.collectionView.dataSource = self
    }
}

//MARK: - UICollectionView Delegate & DataSource

extension PhotoFeedController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as! PhotoCell
        cell.descLabel.text = String(indexPath.item)
        cell.photoImageView.backgroundColor = .tintColor()
        return cell
    }
}

extension PhotoFeedController {
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.barTintColor = .bgColor()
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let navigationLabel = UILabel()
        navigationLabel.text = "PHOTOS"
        navigationLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        navigationLabel.textColor = .textColor()
        
        navigationController?.navigationBar.tintColor = .tintColor()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationLabel)
    }
}
extension PhotoFeedController: UISearchBarDelegate {
    
    private func setupSearchBar(){
        let search = UISearchController(searchResultsController: nil)
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        
        search.hidesNavigationBarDuringPresentation = false
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.delegate = self
    }
    
    //MARK:-  SearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
