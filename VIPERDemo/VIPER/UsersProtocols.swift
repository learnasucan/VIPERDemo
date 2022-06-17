//
//  protocols.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import Foundation
import UIKit
/*
                                                                API
                                                                ^
                                                                | |
VIEW =======================>Presenter========================>Interactor
    <---------------------------||<----------------------------
                                ||
                              Router
 
 ViewToPresenter
 InteractorToPresenter
 
 PresenterToView
 
 PresenterToInteractor
 
 PresenterToRouter
 
*/
//View
//MARK: View Input (View -> Presenter)

protocol ViewToPresenterProtocol {
    var users : [User] { get set }
    
    var view: PresenterToViewProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    
    func viewDidLoad()
    func refresh()
    
    func numberOfRowsInSection() -> Int 
    func cellForRowAt(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell

}

//MARK:- Interactor Output

protocol InteractorToPresenterProtocol : AnyObject{
    func fetchUserListSuccess(users: [User])
    func fetchUserListFailure(error: String)
}

//MARK:- View output  Presenter -> view
protocol PresenterToViewProtocol: AnyObject {
    func onFetchUserListSuccess()
    func onFetchUserListFailure(error: String)
    func showActivity()
    func hideActivity()
}


protocol PresenterToRouterProtocol {
    static func createModule() -> UINavigationController?
    func pushToDetail(on view: PresenterToViewProtocol?)
}


//MARK:- Interactor Input   Presenter -> Interactor
protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? { get set }
    var users: [User]? {get set}
    func fetchUserList()
    func getUserDetailsAt(index: Int)

}


