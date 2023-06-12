//
//  DetailViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import UIKit

class DetailViewController: UIViewController, DetailUI {
    
    //MARK: - IBOutlet
    
    //MARK: - Variables
    var presenter: DetailUIPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
       
    }
    
    func update(detailMovie: DetailMovieBO?) {
        
    }
}
