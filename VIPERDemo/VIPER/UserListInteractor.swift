//
//  UserListInteractor.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import Foundation

class UserListInteractor: PresenterToInteractorProtocol {
    weak var presenter: InteractorToPresenterProtocol?
    
    var users: [User]?
    
    func fetchUserList() {
        guard let users = APIManager.getUserList().userList else {return}
        self.users = users
        presenter?.fetchUserListSuccess(users: users)
    }
    
    func getUserDetailsAt(index: Int) {
        guard let users = APIManager.getUserList().userList else {return}
        //TODO:-
    }

}
