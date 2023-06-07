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
    
    //search
    @IBOutlet weak var searchMedia: UISearchBar!
    
    //MARK: - Variables
    var presenter: PopularMoviePresenter?
    var time: Timer?
    var filter: Bool = false
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnAll.isSelected = true
        presenter?.viewDidLoad()
        styles()
        setUpCollection()
        setUpSearchBar()
    }
    
    //MARK: - setUpCollection
    private func setUpCollection() {
        self.collectionPopularMovies.delegate = self
        self.collectionPopularMovies.dataSource = self
        self.collectionPopularMovies.register(UINib(nibName:"PopularMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier)
    }
    
    //MARK: - setUpSearchBar
    private func setUpSearchBar() {
        searchMedia.showsCancelButton = true
        searchMedia.delegate = self
    }

    //MARK: - Styles
    private func styles() {
        self.collectionPopularMovies.backgroundColor = .white
        
        //Controller
        self.lblTitleController.generalLabel("Populares", .black, .boldSystemFont(ofSize: 20))
       
      
        //buttons
        self.btnAll.generalButton("Todo", tintColor: .black)
        self.btnMovies.generalButton("Peliculas", tintColor: .black)
        self.btnSeries.generalButton("Series", tintColor: .black)
        
        //views
        self.viewButtons.backgroundColor = .white
        self.viewController.backgroundColor = .white
    }
    
    //MARK: - Actions
    @IBAction func btnAllAction(_ sender: Any) {
        self.btnSeries.isSelected = false
        self.btnMovies.isSelected = false
        self.btnAll.isSelected = true
        presenter?.page = 1
        if presenter?.movies.count == 0 {
            presenter?.loadPopularMovies()
        }
        self.update()
    }
    
    
    @IBAction func btnSeriesAction(_ sender: Any) {
        self.btnSeries.isSelected = true
        self.btnMovies.isSelected = false
        self.btnAll.isSelected = false
        presenter?.page = 1
        if presenter?.series.count == 0 {
            presenter?.loadPopularSeries()
        }
        self.update()
    }
    
    @IBAction func btnMovieAction(_ sender: Any) {
        self.btnSeries.isSelected = false
        self.btnMovies.isSelected = true
        self.btnAll.isSelected = false
        presenter?.page = 1
        if presenter?.movies.count == 0 {
            presenter?.loadPopularMovies()
        }
        self.update()
        
    }
}

//MARK: - PopularMovieUI
extension PopularMovieViewController: PopularMovieUI {
    func update() {

        if presenter?.page == 1 {
            DispatchQueue.main.async {
                self.collectionPopularMovies.reloadData()
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.collectionPopularMovies.reloadData()
            }
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
            guard let items =  presenter?.movies.count else { return 0 }
            guard let items1 =  presenter?.searchAll.count else { return 0 }
            return filter ? items1 : items
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
        
        //Ultimo indice para sumar uno a page en el presenter y cargar mas peliculas o series
        let lastIndexMovie = (self.presenter?.movies.count)! - 1
        let lastIndexSerie = (self.presenter?.series.count)! - 1
        
        
        let btnMovie = self.btnMovies.isSelected
        let btnSerie = self.btnSeries.isSelected
        let btnAll = self.btnAll.isSelected
        
        if filter == true && (presenter?.searchAll.count)! > 0 {
            if let item = presenter?.searchAll[indexPath.row] {
                cell.paintCellSearch(item: item)
            }
            if indexPath.row == lastIndexMovie {
                presenter?.page += 1
                presenter?.loadSearchMovies(searchText: nil)
            }
        } else  if  btnMovie || btnAll {
            if let item = presenter?.movies[indexPath.row] {
                cell.paintCell(item: item)
            }
            if indexPath.row == lastIndexMovie {
                presenter?.page += 1
                presenter?.loadPopularMovies()
            }
        } else if btnSerie {
            if let item = presenter?.series[indexPath.row] {
                cell.paintCellSerie(item: item)
            }
            if indexPath.row == lastIndexSerie {
                presenter?.page += 1
                presenter?.loadPopularSeries()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.onTapCell(atIndex: indexPath.row)
    }
}

//MARK: - UISearchBarDelegate
extension PopularMovieViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        time?.invalidate()
        if searchText.count == 3 && presenter?.searchAll.count == 0 {
            presenter?.page = 1
            filter = true
            presenter?.loadSearchMovies(searchText: searchText)
        } else if searchText.count > 3 {
            time = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { [self] _ in
                self.presenter?.searchAll.removeAll()
                self.presenter?.loadSearchMovies(searchText: searchText)
            })
        } else if searchText == "" {
            presenter?.page = 1
            filter = false
            self.presenter?.searchAll.removeAll()
            presenter?.loadPopularMovies()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filter = false
        searchBar.text = ""
        collectionPopularMovies.reloadData()
    }
}

