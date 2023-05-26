//
//  SearchMapper.swift
//  JustLook
//
//  Created by Andres Aleu on 25/5/23.
//

import Foundation

extension ResultSearchDTO {
    func toBo() -> ResultSearchBO? {
        var knowFor: [KnownForBO] = []
        knownFor?.forEach({ p in
            knowFor.append(p.toBoS())
        })
        let _ = DateFormatter()
        guard let backdropPath = backdropPath else { return nil }
        guard let posterPath = posterPath else { return nil }
        //guard let profilePath = profilePath else { return nil }
        return ResultSearchBO(adult: adult,
                              backdropPath: URL(string: backdropPath),
                              id: id,
                              title: title,
                              originalLanguage: originalLanguage,
                              originalTitle: originalTitle,
                              overview: overview,
                              posterPath: URL(string: posterPath),
                              mediaType: mediaType,
                              genreIDS: genreIDS,
                              popularity: popularity,
                              releaseDate: Date(),
                              video: video,
                              voteAverage: voteAverage,
                              voteCount: voteCount,
                              name: name,
                              originalName: originalName,
                              firstAirDate: Date(),
                              originCountry: originCountry,
                              gender: gender,
                              knownForDepartment: knownForDepartment,
                              profilePath: URL(string: profilePath ?? ""),
                              knownFor: knowFor)
    }
}

extension KnownForDTO {
    func toBoS() -> KnownForBO {
        return KnownForBO(adult: adult,
                          backdropPath: URL(string: backdropPath ?? ""),
                          id: id,
                          title: title,
                          originalLanguage: originalLanguage,
                          originalTitle: originalTitle,
                          overview: overview,
                          posterPath: URL(string: posterPath ?? ""),
                          mediaType: mediaType,
                          genreIDS: genreIDS,
                          popularity: popularity,
                          releaseDate: Date(),
                          video: video,
                          voteAverage: voteAverage,
                          voteCount: voteCount)
    }
}
