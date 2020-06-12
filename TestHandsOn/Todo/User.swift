//
//  User.swift
//  testeClass
//
//  Created by Yuri on 09/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

protocol ProjectMap {
    func addTask(task: Task)
    var tasks: [Task] { get set }
}

class User {
    var name: String
    private (set) var projects: [ProjectMap]
    var outstandingTasksString: String {
        get {
            return "\(projects.reduce(0) { $0 + $1.tasks.count }) items"
        }
    }
    
    init(name: String) {
        self.name = name
        self.projects = []
    }
    
    func addProject(project: ProjectMap) {
        self.projects.append(project)
    }
}
