//
//  DetailBO.swift
//  JustLook
//
//  Created by Andres Aleu on 30/5/23.
//

import Foundation

struct DetailMovieBO: Codable {
    let adult: Bool?
    let backdropPath: URL?
    //let belongsToCollection: [String]
    let budget: Double?
    let genres: [GenresBO]?
    let homepage: URL?
    let id: Int?
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: URL?
    let productionCompanies: [ProductionCompaniesBO]?
    let productionCountries: [ProductionCountriesBO]?
    let releaseDate: Date?
    let revenue: Double?
    let runtime: Double?
    let spokenLanguages: [SpokenLanguagesBO]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
       // case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct GenresBO: Codable {
    let id: Int?
    let name: String?
}

struct ProductionCompaniesBO: Codable {
    let id: Int?
    let logoPath: URL?
    let name: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

struct ProductionCountriesBO: Codable {
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "iso_3166_1"
        case name
    }
}

struct SpokenLanguagesBO: Codable {
    let englishName: String?
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case id = "iso_639_1"
        case name
    }
}

