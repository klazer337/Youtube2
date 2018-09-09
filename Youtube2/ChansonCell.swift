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
        telechargerImage()
        let attributed = NSMutableAttributedString(string: self.chanson.titre, attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.black])
        let secondeLigne = NSAttributedString(string: "\n " + self.chanson.artiste, attributes: [.font: UIFont.italicSystemFont(ofSize: 20), .foregroundColor: UIColor.darkGray])
        
        attributed.append(secondeLigne)
        artisteEtTitreLabel.attributedText = attributed
    }
    
    
    func telechargerImage() {
        miniature.image = #imageLiteral(resourceName: "logo")
        
        if let url = URL(string: self.chanson.miniatureUrl) {
            let session = URLSession.shared // on crée une session pour aller chercher une image de puis une URL
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {  // on vérifie que data soit différent de nil
                    DispatchQueue.main.async {
                        self.miniature.image = image
                    }
                }
            })
            task.resume()   // arrêt de la demande URLsession et on revient sur les tâches principales
            
        }
    }
    

}
