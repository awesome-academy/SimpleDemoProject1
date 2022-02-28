//
//  Response.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 27/02/2022.
//

import Foundation

struct Response<T: Codable>: Codable {
    let status: String
    let data: T
}
