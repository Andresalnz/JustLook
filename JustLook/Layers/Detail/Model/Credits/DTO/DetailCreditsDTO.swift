//
//  DetailCreditsDTO.swift
//  JustLook
//
//  Created by Andres Aleu on 12/6/23.
//

import Foundation

struct DetailCreditMoviesDTO: Codable {
    let id: Int?
    let result: [DetailCreditsActMoviesDTO]?
    let personal: [DetailPersonalMoviesDTO]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case result = "cast"
        case personal = "crew"
    }
}

struct DetailCreditsActMoviesDTO: Codable {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: Department?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character: String?
    let creditID: String?
    let order: Int?
   
    
    enum CodingKeys: String, CodingKey {
            case adult
            case gender
            case id
            case knownForDepartment = "known_for_department"
            case name
            case originalName = "original_name"
            case popularity
            case profilePath = "profile_path"
            case castID = "cast_id"
            case character
            case creditID = "credit_id"
            case order
        }
}

struct DetailPersonalMoviesDTO: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: Department?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: String?
    let creditID: String
    let order: Int?
    let department: Department?
    let job: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case creditID = "credit_id"
        case order
        case department
        case job
    }
}


