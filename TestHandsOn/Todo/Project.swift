//
//  Projects.swift
//  testeClass
//
//  Created by Yuri on 09/06/20.
//  Copyright © 2020 academy.ifce. All rights reserved.
//

import Foundation

class Project {
    var name: String
    private (set) var tasks: [Task]
    
    init(name: String) {
        self.name = name
        self.tasks = []
    }
    
    func addTask(task: Task) {
        self.tasks.append(task)
    }
}
