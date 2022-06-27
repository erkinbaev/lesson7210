//
//  PersonCell.swift
//  lesson7210
//
//  Created by User on 6/27/22.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        personImageView.layer.cornerRadius = 100 / 2
        personImageView.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
