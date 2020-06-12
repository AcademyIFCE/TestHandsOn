//
//  HTTPResponseMock.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

class HTTPResponseMock: HTTPURLResponse {
    init(statusCode: Int) {
        super.init(url: URL(string: "https://fake.com")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
