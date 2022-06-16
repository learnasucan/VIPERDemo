//
//  APIManager.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import Foundation

class APIManager {
    
    static func getUserList() -> UserList {
        
        let userList = [ User(name: "Prachit P", detail: "iOS Dev"),
                         User(name: "Suraj J", detail: "iOS Dev"),
                         User(name: "Amin", detail: "iOS Dev"),
                         User(name: "Pratik B", detail: "Front End Dev"),
                         User(name: "Mayur O", detail: "Designer"),
                         User(name: "Vipin", detail: "Backend Dev"),
                         User(name: "Nilesh", detail: "Dev Ops"),
                         User(name: "Dinesh", detail: "Manager")
        ]
        
        return UserList(success: true, userList: userList, error: nil)
        
    }
}
