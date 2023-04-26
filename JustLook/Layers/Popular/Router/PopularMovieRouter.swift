//
//  PopularMovieRouter.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation
import UIKit

class PopularMovieRouter {
    func showPopularMoview(window: UIWindow?) {
        let view = PopularMovieViewController()
        let interactor = PopularMovieInteractor()
        let presenter = PopularMoviePresenter(popularMovieInteractor: interactor)
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        

    }
}
