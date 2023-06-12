//
//  DetailCreditsMapperBO.swift
//  JustLook
//
//  Created by Andres Aleu on 12/6/23.
//

import Foundation

extension DetailCreditsActMoviesDTO {
    func toBo() -> DetailCreditsActMoviesBO {
       return DetailCreditsActMoviesBO(adult: adult,
                                gender: gender,
                                id: id,
                                knownForDepartment: knownForDepartment,
                                name: name,
                                originalName: originalName,
                                popularity: popularity,
                                profilePath: URL(string: profilePath ?? ""),
                                castID: castID,
                                character: character,
                                creditID: creditID,
                                order: order)
    }
}

extension DetailPersonalMoviesDTO {
    func toBo() -> DetailPersonalMoviesBO {
        return DetailPersonalMoviesBO(adult: adult,
                                      gender: gender,
                                      id: id,
                                      knownForDepartment: knownForDepartment,
                                      name: name,
                                      originalName: originalName,
                                      popularity: popularity,
                                      profilePath: URL(string: profilePath ?? ""),
                                      creditID: creditID,
                                      order: order,
                                      department: department,
                                      job: job)
    }
}
