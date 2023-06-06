//
//  Protocols.swift
//  JustLook
//
//  Created by Andres Aleu on 1/6/23.
//

import Foundation

protocol DetailInteractor: AnyObject {
    func getDetailMovieOrSerie<T:Codable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
