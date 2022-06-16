//
//  UserTableViewCell.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    //MARK:- Outlets
    
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var descriptionLabelOutlets: UILabel!
    
    //MARK:- Cell Method
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:- Setup
    
    func setupCell(with model: User){
        nameLabelOutlet.text = model.name
        descriptionLabelOutlets.text = model.detail
    }
    
    
}
