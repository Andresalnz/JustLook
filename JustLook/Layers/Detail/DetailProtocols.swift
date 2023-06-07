//
//  Protocols.swift
//  JustLook
//
//  Created by Andres Aleu on 1/6/23.
//

import Foundation
import UIKit
//Protocolo del Interactor
protocol DetailInteractorProtocol: AnyObject {
    func getDetailMovieOrSerie<T:Codable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

//Protocolo del presenter
protocol DetailPresentable: AnyObject {
    var ui: DetailUI? { get }
    var detailInteractor: DetailInteractorProtocol { get }
    var id: Int? { get }
    var detailMovie: DetailMovieBO? { get }
}

//Protocolo Router
protocol DetailRouting: AnyObject {
    func showDetail(fromViewController: UIViewController ,id: Int)
}

//Protocolo presenter - Interactor
protocol DetailPresenterInteractor : AnyObject {
    func loadDetail()
}

//Protocolo Presenter - View
protocol DetailUI: AnyObject {
    func update(detailMovie: DetailMovieBO? )
}

