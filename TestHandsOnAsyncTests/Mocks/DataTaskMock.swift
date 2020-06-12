//
//  File.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

class DataTaskMock: URLSessionDataTask {
    
    var calledResume = false
    var completion: (Data?, URLResponse?, Error?) -> Void
    
    init(completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.completion = completion
    }
    override func resume() {
        calledResume = true
        completion(nil, nil, nil)
    }
}

class DataTaskMockWithData: URLSessionDataTask {
    override init() {}
    override func resume() {}
}
