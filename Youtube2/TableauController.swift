//
//  TableauController.swift
//  Youtube2
//
//  Created by Kevin Trebossen on 8/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chansons = [Chanson]()
    
    let identifiantCell = "ChansonCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self       // = UITableViewDelegate
        tableView.dataSource = self
        ajouterChanson()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {       // FONCTION OBLIGATOIRE pour se conformer aux protocoles
        return chansons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {    //   Quelle cellule renvoyer ou peupler - FONCTION OBLIGATOIRE
        let chanson = chansons[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {  // Cellules réutilisables
            cell.creerCell(chanson)
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {      // Hauteur des cellules
        return 170
    }
    
    func ajouterChanson() {
        chansons = [Chanson]()
        let cool = Chanson(artiste: "Casseurs Flowters", titre: "Ils sont cools", code: "dq6G2YWoRqA")
        chansons.append(cool)
        let bien = Chanson(artiste: "Orelsan", titre: "Tout va bien", code: "2bjk26RwjyU")
        chansons.append(bien)
        let san = Chanson(artiste: "Orelsan", titre: "San", code: "PejyoeG_TmA")
        chansons.append(san)
        
        tableView.reloadData()  // rechargement des données // mise à jour du tableview
    }

}
