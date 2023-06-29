//
//  DetailPresenter.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import Foundation

final class DetailPresenter: DetailPresentable {
//MARK: - Variables
    weak var ui: DetailUI?
    let detailInteractor: DetailInteractorProtocol
    let id: Int?
    var detailMovie: DetailMovieBO?
    var creditsAct: [DetailCreditsActMoviesBO] = []
    var creditsPersonal: [DetailPersonalMoviesBO] = []
    
    init(id: Int?, detailInteractor: DetailInteractorProtocol) {
        self.detailInteractor = detailInteractor
        self.id = id
    }
}

//MARK: - DetailPresenterInteractor
extension DetailPresenter: DetailPresenterInteractor {
    func loadDetail() {
        detailInteractor.getDetailMovieOrSerie(url: Util.Services.DetailMovie.shapeURL(id: id), type: DetailMovieDTO.self) { [ weak self] data in
            guard let wSelf = self else { return }
            switch data {
                case .success(let response):
                    guard let detailMovieBO = response.toBo() else  { return }
                    wSelf.detailMovie = detailMovieBO
                    wSelf.loadDetailCredits()
                   
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func loadDetailCredits() {
        detailInteractor.getDetailMovieOrSerie(url: Util.Services.detailMovieCredits.shapeURL(id: id), type: DetailCreditMoviesDTO.self) { [weak self] data in
            guard let wSelf = self else { return }
            switch data {
                case .success(let response):
                    if let act: [DetailCreditsActMoviesDTO] = response.result {
                        act.forEach { act in
                            guard let actors = act.toBo() else { return }
                            wSelf.creditsAct.append(actors)
                        }
                    }
                    if let personal = response.personal {
                        personal.forEach { per in
                            guard let personal = per.toBo() else { return }
                            wSelf.creditsPersonal.append(personal)
                        }
                    }
                    wSelf.ui?.update(detailMovie: wSelf.detailMovie, act: wSelf.creditsAct, personal: wSelf.creditsPersonal)
                case .failure(let error):
                    print("hola \(error.localizedDescription)")
            }
        }
    }
  
}

extension DetailPresenter: DetailUIPresenter {
    func viewDidLoad() {
        loadDetail()
    }
}
