//
//  ChansonCell.swift
//  Youtube2
//
//  Created by Kevin Trebossen on 9/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class ChansonCell: UITableViewCell {

    @IBOutlet weak var miniature: UIImageView!
    @IBOutlet weak var artisteEtTitreLabel: UILabel!
    
    var chanson: Chanson!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func creerCell(_ chanson: Chanson){
        self.chanson = chanson // à vérifier
        
        let attributed = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.black])
        let secondeLigne = NSAttributedString(string: "\n " + self.chanson.artiste, attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        
        attributed.append(secondeLigne)
        artisteEtTitreLabel.attributedText = attributed
    }

}
