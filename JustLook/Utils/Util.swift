//
//  Util.swift
//  JustLook
//
//  Created by Andres Aleu on 28/4/23.
//

import Foundation


final class Util {
    
    //MARK: - Obtener apikey de info.plist
    static func getApiKey() -> String? {
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
            let apiKey = Util.getApiKey()!
            let uri = Constants.TMDuri
            switch self {
            case .popularMovie:
                //TODO: Poner lenguage y paginacion
                return URL(string: "\(uri)movie/popular?api_key=\(String(describing: apiKey))&language=en-US&page=\(page)")
            case .popularSerie:
                return URL(string: "\(uri)tv/popular?api_key=\(String(describing: apiKey))&language=en-US&page=\(page)")
            case .searchAll:
                if let searchText = searchText {
                    return URL(string: "\(uri)search/multi?api_key=\(String(describing: apiKey))&query=\(searchText)")
                }
                return URL(string: "\(uri)search/movie?api_key=\(String(describing: apiKey))query=")
            }
        }
    }
}
