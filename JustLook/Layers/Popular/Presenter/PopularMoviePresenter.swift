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
    
    init(popularMovieInteractor: PopularMovieInteractor) {
        self.popularMovieInteractor = popularMovieInteractor
    }
}

extension PopularMoviePresenter: PopularMoviewUIPresenter {
    func viewDidLoad() {
        onViewAppear()
    }
}

extension PopularMoviePresenter: PopularMoviePresenterInteractor {
    func onViewAppear() {
        popularMovieInteractor.getPopularMovies() { [weak self] data in
            guard let wSelf = self else {return }
            switch data {
            case .success(let response):
                wSelf.ui?.update(moview: response)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
