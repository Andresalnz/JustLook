//
//  PopularMovieInteractor.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation
import Alamofire

final class PopularMovieInteractor {
    func getPopularMovies<T: Codable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure((NSError(domain: "url mal", code: -1, userInfo: nil))))
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: T.self) { response in
            if let error = response.error {
                print("error, \(error)")
            }
            
            if let movies = response.value {
                completion(.success(movies))
            }
        }
    }
}
