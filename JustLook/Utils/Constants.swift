//
//  Constants.swift
//  JustLook
//
//  Created by Andres Aleu on 28/4/23.
//

import Foundation

struct Constants {
    //Api Key
    static let apiKey: String = Util.getApiKey()
    static let apiKeyURL: String = "?api_key=\(String(describing: apiKey))"
    
    //Required URLs
    static let TMDuri: String = "https://api.themoviedb.org/3/"
    static let buildImage: URL? = URL(string: "https://image.tmdb.org/t/p/w500")
    
    //URLs
    static let moviePopular: String = "movie/popular"
    static let tvPopular: String = "tv/popular"
    static let searchMulti: String = "search/multi"
    static let query = "&query="
    static let languagePage: String = "&language=en-US&page="
    static let movie: String = "movie/"
}
