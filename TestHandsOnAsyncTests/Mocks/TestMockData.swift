//
//  TestMockData.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

class TestMockData {
    var testData: Data?
    var testError: Error?
    var testResponse: HTTPURLResponse?
    
    init(data: Data?, error: Error?, response: HTTPURLResponse?) {
        self.testData = data
        self.testError = error
        self.testResponse = response
    }
}
