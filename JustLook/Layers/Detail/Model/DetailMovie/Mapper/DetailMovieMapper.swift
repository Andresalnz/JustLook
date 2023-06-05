//
//  DetailMovieMapper.swift
//  JustLook
//
//  Created by Andres Aleu on 31/5/23.
//

import Foundation

extension DetailMovieDTO {
    func toBo() -> DetailMovieBO? {
        guard let genresCollection: [GenresBO] = (genres?.map({$0.toBO()})) else { return nil }
        guard let productionCompaniesCollection: [ProductionCompaniesBO] = (productionCompanies?.map({$0.toBo()})) else { return nil }
        guard let productionCountriesCollection: [ProductionCountriesBO] = (productionCountries?.map({$0.toBo()})) else { return nil }
        guard let spokenLanguagesCollection: [SpokenLanguagesBO] = (spokenLanguages?.map({$0.toBo()})) else { return nil }
        
        return DetailMovieBO(adult: adult,
                             backdropPath: URL(string: backdropPath ?? ""),
                             //belongsToCollection: nil,
                             budget: budget,
                             genres: genresCollection,
                             homepage: URL(string: homepage ?? ""),
                             id: id,
                             imdbId: imdbId,
                             originalLanguage: originalLanguage,
                             originalTitle: originalTitle,
                             overview: overview,
                             popularity: popularity,
                             posterPath: URL(string: posterPath ?? ""),
                             productionCompanies: productionCompaniesCollection,
                             productionCountries: productionCountriesCollection,
                             releaseDate: Date(),
                             revenue: revenue,
                             runtime: runtime,
                             spokenLanguages: spokenLanguagesCollection,
                             status: status,
                             tagline: tagline,
                             title: title,
                             video: video,
                             voteAverage: voteAverage,
                             voteCount: voteCount)
    }
}

extension GenresDTO {
    func toBO() -> GenresBO {
        return GenresBO(id: id,
                        name: name)
    }
}

extension ProductionCompaniesDTO {
    func toBo() -> ProductionCompaniesBO {
        return ProductionCompaniesBO(id: id,
                                     logoPath: URL(string: logoPath ?? ""),
                                     name: name,
                                     originCountry: originCountry)
    }
}

extension ProductionCountriesDTO {
    func toBo() -> ProductionCountriesBO {
        return ProductionCountriesBO(id: id,
                                     name: name)
    }
}

extension SpokenLanguagesDTO {
    func toBo() -> SpokenLanguagesBO {
        return SpokenLanguagesBO(englishName: englishName,
                                 id: id,
                                 name: name)
    }
}
