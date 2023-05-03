//
//  PopularSerieMapper.swift
//  JustLook
//
//  Created by Andres Aleu on 3/5/23.
//

import Foundation

extension ResultSerieDTO {
    func toBo() -> ResultSerieBO? {
        guard let backdropPath = backdropPath else { return nil }
        guard let posterPath = posterPath else { return nil }
        
        return ResultSerieBO(backdropPath: URL(string: backdropPath),
                             firstAirDate: Date(),
                             genreIds: genreIds,
                             id: id,
                             name: name,
                             originCountry: originCountry,
                             originalLanguage: originalLanguage,
                             originalName: originalName,
                             overview: overview,
                             popularity: popularity,
                             posterPath: URL(string: posterPath),
                             voteAverage: voteAverage,
                             voteCount: voteCount)
    }
}
