//
//  PopularSerieBO.swift
//  JustLook
//
//  Created by Andres Aleu on 3/5/23.
//

import Foundation

struct PopularSerieBO: Codable {
    let page: Int?
    let totalPage: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPage = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultSerieBO: Codable {
    let backdropPath: URL?
    let firstAirDate: Date?
    let genreIds: [Int]?
    let id: Int?
    let name: String?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: URL?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIds = "genre_ids"
        case id
        case name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
