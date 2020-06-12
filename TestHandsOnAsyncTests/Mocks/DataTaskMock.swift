//
//  File.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation
@testable import TestHandsOn

class DataTaskMock: URLSessionDataTask {
    var mockData: TestMockData?
    
    var calledResume = false
    var completion: (Data?, URLResponse?, Error?) -> Void
    
    init(mockData: TestMockData? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.completion = completion
        self.mockData = mockData
    }
    
    override func resume() {
        calledResume = true
        completion(mockData?.testData, mockData?.testResponse, mockData?.testError)
    }
}
