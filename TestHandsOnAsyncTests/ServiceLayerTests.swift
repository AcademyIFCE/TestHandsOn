//
//  ServiceLayerTests.swift
//  TestHandsOnAsyncTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class ServiceLayerTests: XCTestCase {
    
    func test_serviceLayer_urlForAllProjectsBR_toBeValid() {
        //given
        let url = URL(string: "https://api.globalgiving.org/api/public/projectservice/countries/BR/projects?api_key=f0859eb6-e16d-470c-93b4-5d7d10fce06b")
        let session = URLSessionMock()
        
        let expect = expectation(description: "getting all projects")
        
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { result in
            XCTAssertEqual(url, session.lastURL)
            expect.fulfill()
        }
        
        
        wait(for: [expect], timeout: 5)
    }
    
    func test_serviceLayer_urlForAllProjectsBR_resumeCalled() {
        let session = URLSessionMock()
        let expect = expectation(description: "getting all projects")
        
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { result in
            XCTAssertEqual(session.dataTask?.calledResume ?? false, true)
            expect.fulfill()
        }
        
        
        wait(for: [expect], timeout: 5)
    }
    
    func test_serviceLayer_urlForAllProjectsBR_returnsData() {
        let session = URLSessionDataMock()
        session.response = HTTPResponseMock(statusCode: 200)
        session.testData = Data("Hello World".utf8)
        let expect = expectation(description: "getting all projects")
        
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { result in
            XCTAssertNotNil(try? result.get())
            expect.fulfill()
        }
        
        
        wait(for: [expect], timeout: 5)
    }
    
    func test_serviceLayer_urlForAllProjectsBR_returnsError() {
        let session = URLSessionDataMock()
        session.response = HTTPResponseMock(statusCode: 400)
        
        let expect = expectation(description: "getting all projects")
        
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                print(error)
                XCTAssertEqual(error, ServiceError.badRequest)
            }
            expect.fulfill()
        }
        
        
        wait(for: [expect], timeout: 5)
    }
}
