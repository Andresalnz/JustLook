//
//  PopularMovieRouter.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation
import UIKit

class PopularMovieRouter: PopularRouting {
    var detalRouting: DetailRouting?
    var popularView: PopularMovieViewController?
    
    func showPopularMoview(window: UIWindow?) {
        self.detalRouting = DetailRouter()
        let view = PopularMovieViewController()
        let interactor = PopularMovieInteractor()
        let presenter = PopularMoviePresenter(popularMovieInteractor: interactor, router: self)
        popularView = PopularMovieViewController()
        presenter.ui = popularView
        popularView?.presenter = presenter
        
        window?.rootViewController = popularView
        window?.makeKeyAndVisible()
        

    }
    
    
    func showDetailM(id: Int) {
        guard let vc = popularView else { return }
        detalRouting?.showDetail(fromViewController: vc, id: id)
    }
}
