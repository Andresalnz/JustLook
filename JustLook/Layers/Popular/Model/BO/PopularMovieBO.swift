//
//  PopularMovieBO.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation

struct PopularMovieBO {
    let page: Int?
    let totalPage: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case result
        case totalPage = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultMovieBO {
    let adult: Bool?
    let backdropPath: URL?
    let genreIds: [Int]?
    let id: Int?
    let originalLanguaje: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: URL?
    let releaseDate: Date?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Double?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguaje = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

/*
 {
 "page": 1,
 "results": [
 {
 "adult": false,
 "backdrop_path": "/lWqjXgut48IK5f5IRbDBAoO2Epp.jpg",
 "genre_ids": [
 16,
 12,
 10751,
 14,
 35
 ],
 "id": 502356,
 "original_language": "en",
 "original_title": "The Super Mario Bros. Movie",
 "overview": "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
 "popularity": 14176.744,
 "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
 "release_date": "2023-04-05",
 "title": "The Super Mario Bros. Movie",
 "video": false,
 "vote_average": 7.5,
 "vote_count": 1306
 },
 
 "total_pages": 37982,
 "total_results": 759625
 }
 */
