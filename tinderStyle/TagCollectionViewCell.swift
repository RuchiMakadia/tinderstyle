//
//  TagCollectionViewCell.swift
//  tinderStyle
//
//  Created by eHeuristic on 18/02/21.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTag: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.gray
        self.layer.cornerRadius = 15
        lblTag.clipsToBounds = true
    }

}
