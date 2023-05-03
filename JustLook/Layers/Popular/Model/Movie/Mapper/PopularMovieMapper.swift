//
//  PopularMovieMapper.swift
//  JustLook
//
//  Created by Andres Aleu on 25/4/23.
//

import Foundation

extension ResultMovieDTO {
    func toBO() -> ResultMovieBO? {
        let dateFormatter = DateFormatter()
        guard let backdropPath = backdropPath else { return nil }
        guard let posterPath = posterPath else { return nil }
        
        return ResultMovieBO(adult: adult,
                             backdropPath: URL(string: backdropPath),
                             genreIds: genreIds,
                             id: id,
                             originalLanguaje: originalLanguaje,
                             originalTitle: originalTitle,
                             overview: overview,
                             popularity: popularity,
                             posterPath: URL(string: posterPath),
                             releaseDate: Date(),
                             title: title,
                             video: video,
                             voteAverage: voteAverage,
                             voteCount: voteCount)
    }
}
