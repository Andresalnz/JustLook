//
//  DetailViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import UIKit

class DetailViewController: UIViewController, DetailUI {
    
    //MARK: - Variables
     var presenter: DetailPresenterInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadDetail()
    
    }
   
    
    func update(detailMovie: DetailMovieBO?) {
        
    }
    
 
}
