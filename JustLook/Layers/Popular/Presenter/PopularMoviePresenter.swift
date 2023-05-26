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
    
    //MARK: - Variables
    var movies: [ResultMovieBO] = []
    var series: [ResultSerieBO] = []
    var searchAll: [ResultSearchBO] = []
    var page: Int = 1
    
    //MARK: - Init
    init(popularMovieInteractor: PopularMovieInteractor) {
        self.popularMovieInteractor = popularMovieInteractor
    }
}

//MARK: - PopularMoviewUIPresenter
extension PopularMoviePresenter: PopularMoviewUIPresenter {
    func viewDidLoad() {
        loadPopularMovies()
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
