//  AlternativeServiceLayerTest.swift
//  AsyncTesteClassTests
//
//  Created by Yuri on 10/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class AlternativeServiceLayerTest: XCTestCase {
    var session: URLSession!
    
    override func setUp() {
        //given
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolMock.self]
        session = URLSession(configuration: config)
    }
    
    
    func test_serviceLayer_URLForAllProjectsBR_toBeValid() {
        //given
        let url = URL(string: "https://api.globalgiving.org/api/public/projectservice/countries/BR/projects?api_key=f0859eb6-e16d-470c-93b4-5d7d10fce06b")!
        let expect = XCTestExpectation(description: "Fetching all BR projects")
        
        //when
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { _ in
            //then
            XCTAssertEqual(url, URLProtocolMock.mock?.lastURL)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 5)
        
    }
    
    
    func test_serviceLayer_URLForAllProjectsBR_resumeCalled() {
        //given
        
        URLProtocolMock.mock = Mocker(statusCode: 200)
        let expect = XCTestExpectation(description: "Fetching all BR projects triggers resume")
        
        //when
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { _ in
            //then
            XCTAssertTrue(URLProtocolMock.mock?.calledResume ?? false)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }
    
    func test_serviceLayer_URLForAllProjectsBR_returnsData() {
        
        //given
        let mock = Mocker(statusCode: 200)
        mock.testData = Data("Hello World".utf8)
        URLProtocolMock.mock = mock
        let expect = XCTestExpectation(description: "Fetching all BR projects triggers success")
        
        //when
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { result in
            //then
            XCTAssertNotNil(try? result.get())
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 5)
    }
    
    override class func tearDown() {
        URLProtocolMock.clearMockData()
    }
    
    func test_serviceLayer_responseError400_returnsBadRequest() {
        //given
        let mock = Mocker(statusCode: 400)
        URLProtocolMock.mock = mock
        let expect = XCTestExpectation(description: "Fetching all BR projects triggers success")
        
        //when
        ServiceLayer.request(router: .getAllProjects(countryCode: "BR"), session: session) { result in
            //then
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error, ServiceError.badRequest)
            }
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 5)
    }
    
}
