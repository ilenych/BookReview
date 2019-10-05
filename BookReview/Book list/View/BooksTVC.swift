//
//  BooksTableViewCell.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

class BooksTVC: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let reuseId = "BooksTVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
