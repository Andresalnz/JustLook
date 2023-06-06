//
//  DetailPresenter.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import Foundation

final class DetailPresenter: DetailPresentable {
    weak var ui: DetailUI?
    let detailInteractor: DetailInteractorProtocol
    let id: Int?
    var detailMovie: DetailMovieBO?
    
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
                    wSelf.ui?.update(detailMovie: wSelf.detailMovie)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
  
}
