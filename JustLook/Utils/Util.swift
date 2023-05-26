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
        
        func shapeURL(page: Int, searchText: String?) ->URL? {
            let apiKey = Constants.apiKeyURL
            let uri = Constants.TMDuri
            switch self {
            case .popularMovie:
                //TODO: Poner lenguage y paginacion
                return URL(string: "\(uri)\(Constants.moviePopular)\(apiKey)\(Constants.languagePage)\(page)")
            case .popularSerie:
                return URL(string: "\(uri)\(Constants.tvPopular)\(apiKey)\(Constants.languagePage)\(page)")
            case .searchAll:
                if let searchText = searchText {
                    return URL(string: "\(uri)\(Constants.searchMulti)\(apiKey)\(Constants.query)\(searchText)")
                }
                return URL(string: "\(uri)\(Constants.moviePopular)\(apiKey)\(Constants.languagePage)\(page)")
            }
        }
    }
}
