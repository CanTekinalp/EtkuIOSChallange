//
//  UserCell.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    func configure(userViewModel: UserViewModel?) {
        self.nameLabel.text = userViewModel?.name
        self.ageLabel.text = userViewModel?.age
        self.genderLabel.text = userViewModel?.gender
        self.emailLabel.text = userViewModel?.email
    }
    
}
