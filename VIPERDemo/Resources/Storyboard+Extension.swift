//
//  Storyboard+Extension.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-17.
//

import UIKit

enum StoryBoard: String {
    case Main
}

extension StoryBoard {
    
    func instantiate<T: UIViewController>(storyBoard: StoryBoard) -> T {
        let st = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        let vc = st.instantiateViewController(withIdentifier: identifier) as! T
        return vc
    }
}
