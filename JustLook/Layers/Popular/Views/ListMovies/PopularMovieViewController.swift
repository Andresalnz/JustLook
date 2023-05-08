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
    
    //Buttons
    @IBOutlet weak var viewButtons: UIView!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnSeries: UIButton!
    @IBOutlet weak var btnMovies: UIButton!
    
    //Controller
    @IBOutlet weak var viewController: UIView!
    @IBOutlet weak var lblTitleController: UILabel!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    //MARK: - Variables
    var presenter: PopularMoviePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnAll.isSelected = true
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
        
        //Controller
        self.lblTitleController.generalLabel("Populares", .white, .boldSystemFont(ofSize: 20))
        self.btnSearch.generalButtonWithImage("", tintColor: .white, image: UIImage(systemName: "magnifyingglass"))
      
        //buttons
        self.btnAll.generalButton("Todo", tintColor: .white)
        self.btnMovies.generalButton("Peliculas", tintColor: .white)
        self.btnSeries.generalButton("Series", tintColor: .white)
        
        //views
        self.viewButtons.backgroundColor = .black
        self.viewController.backgroundColor = .black
    }
    
    //MARK: - Actions
    @IBAction func btnAllAction(_ sender: Any) {
        self.btnSeries.isSelected = false
        self.btnMovies.isSelected = false
        self.btnAll.isSelected = true
        presenter?.loadPopularMovies()
    }
    
    
    @IBAction func btnSeriesAction(_ sender: Any) {
        self.btnSeries.isSelected = true
        self.btnMovies.isSelected = false
        self.btnAll.isSelected = false
        presenter?.loadPopularSeries()
    }
    
    @IBAction func btnMovieAction(_ sender: Any) {
        self.btnSeries.isSelected = false
        self.btnMovies.isSelected = true
        self.btnAll.isSelected = false
        presenter?.loadPopularMovies()
    }
}

extension PopularMovieViewController: PopularMovieUI {
    func update() {
        DispatchQueue.main.async {
            self.collectionPopularMovies.reloadData()
        }
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension PopularMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let btnMovie = self.btnMovies.isSelected
        let btnSerie = self.btnSeries.isSelected
        let btnAll = self.btnAll.isSelected
        
        if btnMovie || btnAll {
            guard let items = presenter?.movies.count else { return 0 }
            return items
        } else if btnSerie {
            guard let items = presenter?.series.count else { return 0 }
            return items
        }
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PopularMovieCollectionViewCell = collectionPopularMovies.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as? PopularMovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let btnMovie = self.btnMovies.isSelected
        let btnSerie = self.btnSeries.isSelected
        let btnAll = self.btnAll.isSelected
        
        if  btnMovie || btnAll {
            if let item = presenter?.movies[indexPath.row] {
                cell.paintCell(item: item)
            }
        } else if btnSerie {
           
            if let item = presenter?.series[indexPath.row] {
                cell.paintCellSerie(item: item)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize (width: 180, height: 280)
    }
}


    
    

    

