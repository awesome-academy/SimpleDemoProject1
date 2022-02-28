//
//  ErrorResponse.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

class ErrorResponse: Codable {
    let documentationUrl: String?
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case documentationUrl = "documentation_url"
        case message
    }
}
