//
//  PopularMovieInteractor.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation
import Alamofire

final class PopularMovieInteractor {
    func getPopularMovies(completion: @escaping (Result<[ResultMovieDTO], Error>) -> Void) {
        guard let url = Util.Services.popularMovie.shapeURL() else {
            completion(.failure((NSError(domain: "url mal", code: -1, userInfo: nil))))
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: PopularMovieDTO.self) { response in
            if let error = response.error {
                print("error, \(error)")
            }
            
            if let movies = response.value?.results {
                completion(.success(movies))
            }
        }
    }
}
