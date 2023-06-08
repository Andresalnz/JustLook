//
//  DetailRouter.swift
//  JustLook
//
//  Created by Andres Aleu on 6/6/23.
//

import Foundation
import UIKit

class DetailRouter: DetailRouting {
    func showDetail(fromViewController: UIViewController ,id: Int) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(id: id, detailInteractor: interactor)
        let view = DetailViewController()
        presenter.ui = view
        view.presenter = presenter
        
       // fromViewController.present(view, animated: true)
        fromViewController.navigationController?.pushViewController(view, animated: true)
    }
}
