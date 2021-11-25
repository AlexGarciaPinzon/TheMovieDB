//
//  TvShowsCell.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import UIKit

class TvShowsCell: UICollectionViewCell {

    
    
    @IBOutlet weak var tvShowName: UILabel!
    @IBOutlet weak var tvShowDate: UILabel!
    @IBOutlet weak var tvShowRate: UILabel!
    @IBOutlet weak var tvShowImage: UIImageView!
    @IBOutlet weak var tvShowDescription: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
