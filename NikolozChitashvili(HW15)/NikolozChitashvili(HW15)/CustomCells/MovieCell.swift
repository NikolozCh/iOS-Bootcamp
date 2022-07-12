//
//  MovieCell.swift
//  NikolozChitashvili(HW15)
//
//  Created by Nikoloz Chitashvili on 12.07.22.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieIMDBRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
