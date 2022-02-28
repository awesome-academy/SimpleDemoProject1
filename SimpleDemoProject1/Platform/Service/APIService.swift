//
//  APIService.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

class APIService {
    private init() { }
    
    static let shared = APIService()
    
    func request<T: Codable>(input: BaseRequest, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let url = URL(string: input.url)
        guard let url = url else {
            completion(.failure(BaseError.unexpectedError))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = input.requestType.rawValue
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(BaseError.unexpectedError))
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    completion(.failure(BaseError.httpError(httpCode: httpResponse.statusCode)))
                }
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        })
        task.resume()
    }
}
