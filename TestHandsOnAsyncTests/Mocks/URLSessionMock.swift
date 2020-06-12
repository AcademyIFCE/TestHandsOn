//
//  URLSessionMock.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation
@testable import TestHandsOn

class URLSessionMock: URLSession {
    var lastURL: URL?
    var dataTask: DataTaskMock?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        let newDataTask = DataTaskMock(completion: completionHandler)
        dataTask = newDataTask
        return newDataTask
    }
    
}

class URLSessionDataMock: URLSession {
    var testData: Data?
    var testError: ServiceError?
    var response: HTTPURLResponse?
    var dataTask: DataTaskMockWithData?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer {
            completionHandler(testData, response, testError)
        }
        let newDataTask = DataTaskMockWithData()
        dataTask = newDataTask
        return newDataTask
    }
    
}
