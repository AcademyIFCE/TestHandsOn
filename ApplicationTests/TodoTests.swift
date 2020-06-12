//
//  TodoTests.swift
//  ApplicationTests
//
//  Created by Yuri on 12/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import XCTest
@testable import TestHandsOn

class TodoTests: XCTestCase {
    
    var sut: User!
    
    override func setUp() {
        sut = User(name: "Taylor")
    }

    private func addProjects(projects: Int, taskPerProjects: Int) {
        for i in 1...projects {
            let project = Project(name: "Project \(i)")
            sut.addProject(project: project)
            
            for song in 1...taskPerProjects {
                project.addTask(task: Task(name: "Song \(song)"))
            }
        }
    }
    
    func test_userOutstandingTasks_toBeEqual30() {
        //given
        addProjects(projects: 3, taskPerProjects: 10)
        
        //when
        let output = sut.outstandingTasksString
        
        //then
        XCTAssertEqual(output, "30 items")
    }
    
    func test_userOutstandingTasks_toBeEqual20() {
        //given
        addProjects(projects: 2, taskPerProjects: 10)
        
        //when
        let output = sut.outstandingTasksString
        
        //then
        XCTAssertEqual(output, "20 items")
    }
    
    override func tearDown() {
        sut = nil
    }
}
