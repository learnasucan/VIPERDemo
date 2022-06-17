//
//  UserListRouter.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import UIKit

class UserListRouter: PresenterToRouterProtocol {
    static func createModule() -> UINavigationController? {
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserListVC") as? UserListVC else { return nil }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = UserListPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = UserListRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = UserListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    func pushToDetail(on view: PresenterToViewProtocol?) {
        
    }
}
