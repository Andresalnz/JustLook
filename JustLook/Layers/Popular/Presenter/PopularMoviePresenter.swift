//
//  PopularMoviePresenter.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation

final class PopularMoviePresenter {
    weak var ui: PopularMovieUI?
    let popularMovieInteractor: PopularMovieInteractor
    var movies: [ResultMovieBO] = []
    var series: [ResultSerieBO] = []
    
    var page: Int = 1
    
    init(popularMovieInteractor: PopularMovieInteractor) {
        self.popularMovieInteractor = popularMovieInteractor
    }
}

extension PopularMoviePresenter: PopularMoviewUIPresenter {
    func viewDidLoad() {
        loadPopularMovies()
    }
}

extension PopularMoviePresenter: PopularMoviePresenterInteractor {
    func loadPopularMovies() {
        popularMovieInteractor.getPopularMovies(url: Util.Services.popularMovie.shapeURL(page: page), type: PopularMovieDTO.self) { [weak self] data in
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
        popularMovieInteractor.getPopularMovies(url: Util.Services.popularSerie.shapeURL(page: page), type: PopularSerieDTO.self) { [weak self] data in
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
}
