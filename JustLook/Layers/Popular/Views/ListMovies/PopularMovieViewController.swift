//
//  PopularMovieViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import UIKit

class PopularMovieViewController: UIViewController {
    
    var presenter: PopularMoviePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PopularMovieViewController: PopularMovieUI {
    func update(moview: [ResultMovieDTO]) {
        print(moview)
    }
}


    
    

    

