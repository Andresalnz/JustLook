//
//  DetailMovieInteractor.swift
//  JustLook
//
//  Created by Andres Aleu on 31/5/23.
//

import Foundation
import Alamofire

class DetailInteractor: DetailInteractorProtocol {
    func getDetailMovieOrSerie<T:Codable>(url: URL?, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure((NSError(domain: "url mal", code: -1, userInfo: nil))))
            return
        }
        
        AF.request(url, method: .get).responseDecodable(of: T.self) { response in
            if let error = response.error {
                completion(.failure((NSError(domain: "Error response", code: -1, userInfo: nil))))
            }
            
            if let detail = response.value {
                completion(.success(detail))
            } else {
                print(response.error?.localizedDescription)
            }
        }
    }
}
