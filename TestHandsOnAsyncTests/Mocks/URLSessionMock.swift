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
    var testData: Data?
    var testError: ServiceError?
    var testResponse: HTTPURLResponse?
    var lastURL: URL?
    var dataTask: DataTaskMock?
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = request.url
        let testMock = TestMockData(data: testData, error: testError, response: testResponse)
        let newDataTask = DataTaskMock(mockData: testMock, completion: completionHandler)
        dataTask = newDataTask
        return newDataTask
    }
    
}
