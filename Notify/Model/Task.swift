//
//  Task.swift
//  Notify
//
//  Created by Alumne on 09/11/2020.
//

import Foundation

class Task: NSObject {
    var name: String?
    var completed: Bool = false
    
    init(name: String, completed: Bool) {
        super.init()
        
        self.name = name;
        self.completed = completed;
    }
}
