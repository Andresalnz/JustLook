//
//  PopularMoviePresenter.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation

final class PopularMoviePresenter {
    //MARK: - Layers
    weak var ui: PopularMovieUI?
    let popularMovieInteractor: PopularMovieInteractor
    let router: PopularRouting
    //MARK: - Variables
    var movies: [ResultMovieBO] = []
    var series: [ResultSerieBO] = []
    var searchAll: [ResultSearchBO] = []
    var page: Int = 1
    var filter: Bool = false
    //MARK: - Init
    init(popularMovieInteractor: PopularMovieInteractor, router: PopularRouting) {
        self.popularMovieInteractor = popularMovieInteractor
        self.router = router
    }
}

//MARK: - PopularMoviewUIPresenter
extension PopularMoviePresenter: PopularMoviewUIPresenter {
    func viewDidLoad() {
        loadPopularMovies()
    }
    
    func onTapCell(atIndex: Int, serie: Bool) {
        if filter {
            guard let id = searchAll[atIndex].id else { return }
            router.showDetailM(id: id)
        } else if serie {
            guard let id = series[atIndex].id else { return }
            print("No hay detalle")
        } else {
            guard let id = movies[atIndex].id else { return }
            router.showDetailM(id: id)
        }
        
    }
}

//MARK: - PopularMoviePresenterInteractor
extension PopularMoviePresenter: PopularMoviePresenterInteractor {
    
    func loadPopularMovies() {
        popularMovieInteractor.getPopularAndSearch(url: Util.Services.popularMovie.shapeURL(page: page, searchText: nil), type: PopularMovieDTO.self) { [weak self] data in
            guard let wSelf = self else {return }
            switch data {
            case .success(let response):
                if let movie: [ResultMovieDTO] = response.results {
                    movie.forEach({ movie in
                        guard let movie = movie.toBO() else { return }
                        wSelf.movies.append(movie)
                    })
                    wSelf.ui?.update()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadPopularSeries() {
        popularMovieInteractor.getPopularAndSearch(url: Util.Services.popularSerie.shapeURL(page: page, searchText: nil), type: PopularSerieDTO.self) { [weak self] data in
            guard let wSelf = self else { return  }
            switch data {
            case .success(let response):
                if let serie: [ResultSerieDTO] = response.results {
                    serie.forEach { serie in
                        guard let serie = serie.toBo() else { return }
                        wSelf.series.append(serie)
                    }
                    wSelf.ui?.update()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadSearchMovies(searchText: String?) {
        popularMovieInteractor.getPopularAndSearch(url: Util.Services.searchAll.shapeURL(page: page, searchText: searchText), type: SearchDTO.self) { [weak self] data in
            guard let wSelf = self else { return }
            switch data {
            case .success(let response):
                if let searchMovies = response.results {
                    searchMovies.forEach { media in
                        guard let media = media.toBo() else { return }
                        wSelf.searchAll.append(media)
                    }
                    wSelf.ui?.update()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
