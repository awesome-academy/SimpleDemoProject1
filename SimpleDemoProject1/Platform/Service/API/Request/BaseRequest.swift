//
//  BaseRequest.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import Foundation

class BaseRequest: NSObject {
    var url = ""
    var requestType = HTTPMethod.get
    var body: [String: Any]?
    
    init(url: String) {
        super.init()
        self.url = url
    }
    
    init(url: String, requestType: HTTPMethod) {
        super.init()
        self.url = url
        self.requestType = requestType
    }
    
    init(url: String, requestType: HTTPMethod, body: [String: Any]?) {
        super.init()
        self.url = url
        self.requestType = requestType
        self.body = body
    }
}
