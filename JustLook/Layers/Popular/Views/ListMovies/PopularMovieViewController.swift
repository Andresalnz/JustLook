//
//  PopularMovieViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import UIKit

class PopularMovieViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var collectionPopularMovies: UICollectionView!
    
    //MARK: - Variables
    var presenter: PopularMoviePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        styles()
        setUpCollection()
    }
    
    //MARK: - setUpCollection
    func setUpCollection() {
        self.collectionPopularMovies.delegate = self
        self.collectionPopularMovies.dataSource = self
        self.collectionPopularMovies.register(UINib(nibName:"PopularMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier)
    }
    
    //MARK: - Styles
    func styles() {
        self.collectionPopularMovies.backgroundColor = .black
    }
}

extension PopularMovieViewController: PopularMovieUI {
    func update(moview: ResultMovieBO) {
        print(moview)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PopularMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PopularMovieCollectionViewCell = collectionPopularMovies.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as? PopularMovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}


    
    

    

