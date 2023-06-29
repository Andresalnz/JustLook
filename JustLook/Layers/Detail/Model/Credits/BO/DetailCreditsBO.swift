//
//  DetailCreditsBO.swift
//  JustLook
//
//  Created by Andres Aleu on 12/6/23.
//

import Foundation

struct DetailCreditMoviesBO: Codable {
    let id: Int?
  
}

struct DetailCreditsActMoviesBO: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: Department?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: URL?
    let castID: Int?
    let character: String?
    let creditID: String?
    let order: Int?
   
    
    enum CodingKeys: String, CodingKey {
            case adult, gender, id
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

struct DetailPersonalMoviesBO: Codable {
    let adult: Bool?
    let gender: Int?
    let id: Int?
    let knownForDepartment: Department?
    let name: String?
    let originalName: String?
    let popularity: Double?
    let profilePath: URL?
    let creditID: String?
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
        case department
        case job
    }
}

enum Department: String, Codable {
    case acting = "Acting"
    case art = "Art"
    case camera = "Camera"
    case costumeMakeUp = "Costume & Make-Up"
    case crew = "Crew"
    case directing = "Directing"
    case editing = "Editing"
    case lighting = "Lighting"
    case production = "Production"
    case sound = "Sound"
    case visualEffects = "Visual Effects"
    case writing = "Writing"
}
