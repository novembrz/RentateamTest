//
//  ViewController.swift
//  RentateamTest
//
//  Created by Дарья on 16.02.2021.
//

import UIKit

class PhotoFeedViewController: UIViewController {
    
    private var viewModel: PhotoFeedViewModel?
    private var refreshControl = UIRefreshControl()
    private var timer: Timer?
    
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
        viewModel = PhotoFeedViewModel()
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

extension PhotoFeedViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as? PhotoCell, let viewModel = viewModel else {return UICollectionViewCell()}
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }

        let newsVC = PhotoViewController()
        let news = viewModel.photos[indexPath.item]
        newsVC.photo = news
        
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
}

//MARK: - Setup NavigationBar

extension PhotoFeedViewController {
    
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

//MARK: - Setup SearchBar

extension PhotoFeedViewController: UISearchBarDelegate {
    
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
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.photoFeedView.activityIndicator.startAnimating()
            self.photoFeedView.activityIndicator.hidesWhenStopped = true
            self.viewModel?.searchPhoto(searchText: searchText) { [weak self] in
                DispatchQueue.main.async {
                    self?.photoFeedView.collectionView.reloadData()
                    self?.photoFeedView.activityIndicator.stopAnimating()
                }
            }
        })
    }
}
