//
//  Protocols.swift
//  JustLook
//
//  Created by Andres Aleu on 26/4/23.
//

import Foundation
import UIKit
//Protocolo para conectar Presenter con Vista
protocol PopularMovieUI: AnyObject {
    func update()
}

//Protocolo para conectar Vista con Presenter
protocol PopularMoviewUIPresenter: AnyObject {
    func viewDidLoad()
}

//Protocolo para conectar Presenter con Interactor
protocol PopularMoviePresenterInteractor: AnyObject {
    func loadPopularMovies()
    func loadPopularSeries()
    func loadSearchMovies(searchText: String?)
}

protocol PopularRouting: AnyObject {
    var detalRouting: DetailRouting? { get }
    var popularView: PopularMovieViewController? { get }
    func showPopularMoview(window: UIWindow?)
    func showDetailM(id: Int)
}
