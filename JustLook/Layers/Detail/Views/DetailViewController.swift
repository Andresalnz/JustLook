//
//  DetailViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import UIKit

class DetailViewController: UIViewController, DetailUI {
    
    //MARK: - IBOutlet
    @IBOutlet weak var scrollViewDetail: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    //MARK: - Variables
    var presenter: DetailUIPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
       
    }
    
    func update(detailMovie: DetailMovieBO?) {
        
    }
}
