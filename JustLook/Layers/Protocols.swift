//
//  Protocols.swift
//  JustLook
//
//  Created by Andres Aleu on 26/4/23.
//

import Foundation

//Protocolo para conectar Presenter con Vista
protocol PopularMovieUI: AnyObject {
    func update(moview: [ResultMovieDTO])
}

//Protocolo para conectar Vista con Presenter
protocol PopularMoviewUIPresenter: AnyObject {
    func viewDidLoad()
}

//Protocolo para conectar Presenter con Interactor
protocol PopularMoviePresenterInteractor: AnyObject {
    func onViewAppear()
}
