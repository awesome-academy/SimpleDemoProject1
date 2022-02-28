//
//  GithubRepoRepository.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

protocol CoinsRepositoryType {
    func getCoins(input: CoinsRequest, completion: @escaping ([Coin]?, Error?) -> Void)
}

class CoinsRepository: CoinsRepositoryType {
    private let api = APIService.shared
    
    func getCoins(input: CoinsRequest, completion: @escaping ([Coin]?, Error?) -> Void) {
        api.request(input: input, expecting: Response<CoinsResponse>.self) { result in
            switch result {
            case .success(let result):
                completion(result.data.coins, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
