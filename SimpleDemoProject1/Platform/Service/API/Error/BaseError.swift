//
//  BaseError.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

enum BaseError: Error {
    
    case networkError
    case httpError(httpCode: Int)
    case unexpectedError
    case apiFailure(error: ErrorResponse?)
    
    public var errorMessage: String? {
        switch self {
        case .networkError:
            return "Network Error"
        case .httpError(let code):
            return getHttpErrorMessage(httpCode: code)
        case .apiFailure(let error):
            guard let error = error else {
                return error?.message
            }
            return error.message
            
        default:
            return "Unexpected Error"
        }
    }
    
    private func getHttpErrorMessage(httpCode: Int) -> String? {
        guard let responseType = HTTPStatusCode(rawValue: httpCode)?.responseType else {
            return "Unknow Error"
        }
        switch responseType {
        case .informational:
            return "Information Error"
        case .success:
            return "Request success"
        case .redirection:
            return "It was transferred to different UTL. I'm sorry for causing you trouble"
        case .clientError:
            return "An error occurred on the application side. Please try again later!"
        case .serverError:
            return "A server error occured. Please try again later!"
        case .undefined:
            return "Undefined Error"
        }
    }
}
