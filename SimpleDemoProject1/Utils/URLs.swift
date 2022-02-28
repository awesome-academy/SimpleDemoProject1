//
//  URLs.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

struct URLs {
    private static var APIBaseUrl = "https://api.coinranking.com/v2"
    
    public static var coins = APIBaseUrl + "/coins?limit=30"
}
