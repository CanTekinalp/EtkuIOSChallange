//
//  UserDetailsCell.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import UIKit

class UserDetailsCell: UITableViewCell {

    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(viewModel: UserViewModel) {
        self.aboutLabel.text = viewModel.about
        self.nameLabel.text = viewModel.name
        self.phoneLabel.text = viewModel.phone
        self.genderLabel.text = viewModel.gender
        self.idLabel.text = viewModel.id
        self.eyeColorLabel.text = viewModel.eyeColor
        self.addressLabel.text = viewModel.address
        self.companyLabel.text = viewModel.company
        self.ageLabel.text = viewModel.age        
    }
    
}
