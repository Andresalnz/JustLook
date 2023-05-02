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


    
    

    

