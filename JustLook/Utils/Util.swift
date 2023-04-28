//
//  Util.swift
//  JustLook
//
//  Created by Andres Aleu on 28/4/23.
//

import Foundation


final class Util {
    
    static func getApiKey() -> String? {
        let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
        guard let key = apiKey else {
            return "No existe"
        }
        return key
    }
}
