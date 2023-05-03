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
        popularMovieInteractor.getPopularMovies(url: Util.Services.popularMovie.shapeURL(), type: PopularMovieDTO.self) { [weak self] data in
            guard let wSelf = self else {return }
            switch data {
            case .success(let response):
                if let movie: [ResultMovieDTO] = response.results {
                    movie.forEach({ movie in
                        guard let movie = movie.toBO() else { return }
                        wSelf.movies.append(movie)
                    })
                    wSelf.ui?.update(moview: wSelf.movies)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
