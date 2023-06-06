//
//  Protocols.swift
//  JustLook
//
//  Created by Andres Aleu on 1/6/23.
//

import Foundation

//Protocolo del Interactor
protocol DetailInteractorProtocol: AnyObject {
    func getDetailMovieOrSerie<T:Codable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailUI? { get }
    var detailInteractor: DetailInteractorProtocol { get }
    var id: Int? { get }
    var detailMovie: DetailMovieBO? { get }
}

//Protocolo presenter - Interactor
protocol DetailPresenterInteractor : AnyObject {
    func loadDetail()
}

//Protocolo Presenter - View
protocol DetailUI: AnyObject {
    func update(detailMovie: DetailMovieBO? )
}

//Extenison para colocar parametros por defectos
extension DetailUI {
    func update (detailMovie: DetailMovieBO? = nil ) {
        update(detailMovie: detailMovie)
    }
}
