//
//  UserListPresenter.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import UIKit

//MARK:- Contains the view logic to prepare the content of display
class UserListPresenter: ViewToPresenterProtocol {
    var users: [User] = [User]()
    
    weak var view: PresenterToViewProtocol?
    var router: PresenterToRouterProtocol?
    var interactor: PresenterToInteractorProtocol?
    
    func viewDidLoad() {
        self.view?.showActivity()
        //Presenter asking Interactor to load user data
        interactor?.fetchUserList()
    }
    
    func refresh() {
        self.view?.showActivity()
        //Presenter asking Interactor to load user data
        interactor?.fetchUserList()
    }
    
    func numberOfRowsInSection() -> Int {
        users.count
    }
    
    func cellForRowAt(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifier)
                as? UserTableViewCell
        else { return UITableViewCell () }
        cell.setupCell(with: users[indexPath.row])
        return cell
    }
    
}

extension UserListPresenter: InteractorToPresenterProtocol {
    func fetchUserListSuccess(users: [User]) {
        self.users = users
        view?.hideActivity()
        view?.onFetchUserListSuccess()
    }
    
    func fetchUserListFailure(error: String) {
        view?.hideActivity()
        view?.onFetchUserListFailure(error: error)
    }
    
}
