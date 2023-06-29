//
//  Util.swift
//  JustLook
//
//  Created by Andres Aleu on 28/4/23.
//

import Foundation


final class Util {
    
    //MARK: - Obtener apikey de info.plist
    static func getApiKey() -> String {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        guard let key = apiKey else {
            return "No existe"
        }
        return key
    }
    
    //MARK: - Formar URL segun peticion
    enum Services {
        case popularMovie
        case popularSerie
        case searchAll
        case DetailMovie
        case detailMovieCredits
        
        func shapeURL(page: Int? = nil, searchText: String? = nil, id: Int? = nil) -> URL? {
            let apiKey = Constants.apiKeyURL
            let uri = Constants.TMDuri
            switch self {
            case .popularMovie:
                guard let page = page else { return nil }
                //TODO: Poner lenguage y paginacion
                return URL(string: "\(uri)\(Constants.moviePopular)\(apiKey)\(Constants.languagePage)\(page)")
            case .popularSerie:
                guard let page = page else { return nil }
                return URL(string: "\(uri)\(Constants.tvPopular)\(apiKey)\(Constants.languagePage)\(page)")
            case .searchAll:
                guard let page = page else { return nil }
                if let searchText = searchText {
                    return URL(string: "\(uri)\(Constants.searchMulti)\(apiKey)\(Constants.query)\(searchText)")
                }
                return URL(string: "\(uri)\(Constants.moviePopular)\(apiKey)\(Constants.languagePage)\(page)")
                    
                case .DetailMovie:
                    guard let id = id else { return URL(string: "") }
                    return URL(string: "\(uri)\(Constants.movie)\(id)\(apiKey)")
                case .detailMovieCredits:
                    guard let id = id else { return URL(string: "") }
                   print("\(uri)\(Constants.movie)\(id)\(Constants.credits)\(apiKey)")
                    return URL(string: "\(uri)\(Constants.movie)\(id)\(Constants.credits)\(apiKey)")
            }
        }
    }
}
