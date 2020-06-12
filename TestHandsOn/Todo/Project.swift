//
//  Projects.swift
//  testeClass
//
//  Created by Yuri on 09/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

class Project: ProjectMap {
    var name: String
    var tasks: [Task]
    
    init(name: String) {
        self.name = name
        self.tasks = []
    }
    
    func addTask(task: Task) {
        self.tasks.append(task)
    }
}
