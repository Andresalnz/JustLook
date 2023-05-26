//
//  SearchBO.swift
//  JustLook
//
//  Created by Andres Aleu on 25/5/23.
//

import Foundation

// MARK: - Search
struct SearchBO: Codable {
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct ResultSearchBO: Codable {
    let adult: Bool?
    let backdropPath: URL?
    let id: Int?
    let title: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: URL?
    let mediaType: MediaType
    let genreIDS: [Int]?
    let popularity: Double
    let releaseDate: Date?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Double?
    let name: String?
    let originalName: String?
    let firstAirDate: Date?
    let originCountry: [String]?
    let gender: Int?
    let knownForDepartment: String?
    let profilePath: URL?
    let knownFor: [KnownForBO]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case gender
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownForBO: Codable {
    let adult: Bool?
    let backdropPath: URL?
    let id: Int?
    let title: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: URL?
    let mediaType: MediaType?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: Date?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Double?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


