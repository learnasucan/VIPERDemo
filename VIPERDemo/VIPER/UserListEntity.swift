//
//  UserListEntity.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import Foundation


struct UserList: Codable {
    var success: Bool
    var userList: [User]?
    var error: String?
    
}

struct User: Codable {
    var name: String?
    var detail: String?
}
