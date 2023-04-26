//
//  PopularMovieInteractor.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation
import Alamofire

final class PopularMovieInteractor {
    func getPopularMovies(url: String, completion: @escaping (Result<[ResultMovieDTO], Error>) -> Void) {
        AF.request("https://api.themoviedb.org/3/movie/popular?api_key=d24265d9cbfd2e4119f0539b474f7c64&language=en-US&page=1", method: .get).response { response in
            if let error = response.error {
                print("error, \(error)")
            }
            guard let data = response.data else {
                
                completion(.failure(NSError(domain: "No data or invalid response", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let parseJsonPopularFilms = try JSONDecoder().decode(PopularMovieDTO.self, from: data)
                
                if let results = parseJsonPopularFilms.results {
                    completion(.success(results))
                }
            }catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
}
