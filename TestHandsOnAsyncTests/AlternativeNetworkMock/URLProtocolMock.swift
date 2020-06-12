//
//  URLProtocolMock.swift
//  AsyncTesteClassTests
//
//  Created by Yuri on 10/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

class Mocker {
    var testData: Data?
    var testError: Error?
    var lastURL: URL?
    var url: URL
    var statusCode: Int
    var calledResume = false
    
    init(url: URL = URL(string: "https://fakeURL.com")!, statusCode: Int) {
        self.url = url
        self.statusCode = statusCode
    }
}

class URLProtocolMock: URLProtocol {
    static var mock: Mocker?
    
    override class func canInit(with request: URLRequest) -> Bool {
        URLProtocolMock.mock?.lastURL = request.url
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        guard let mock = URLProtocolMock.mock else { fatalError("Needs to define mock") }
        mock.calledResume = true
        
        let response = HTTPURLResponse(url: mock.url, statusCode: mock.statusCode, httpVersion: nil, headerFields: nil)!
        self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowedInMemoryOnly)
        self.client?.urlProtocol(self, didLoad: URLProtocolMock.mock?.testData ?? Data())
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
    
    static func clearMockData() {
        URLProtocolMock.mock = nil
    }
}
