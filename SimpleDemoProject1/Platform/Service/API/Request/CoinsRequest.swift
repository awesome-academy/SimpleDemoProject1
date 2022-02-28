//
//  GithubRepoRequest.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

final class CoinsRequest: BaseRequest {
    required init() {
        super.init(url: URLs.coins, requestType: .get)
    }
}
