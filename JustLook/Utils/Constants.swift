//
//  Constants.swift
//  JustLook
//
//  Created by Andres Aleu on 28/4/23.
//

import Foundation

struct Constants {
    static let TMDuri: String = "https://api.themoviedb.org/3/"
    static let apiKey: String? = Util.getApiKey()
    static let buildImage: URL? = URL(string: "https://image.tmdb.org/t/p/w500")
}
