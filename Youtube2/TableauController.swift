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
    let identifiantSegue = "VersVideo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self       // = UITableViewDelegate
        tableView.dataSource = self
        ajouterChanson()
        title = "Mes vidéos préférées"
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
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {         // ligne sélectionnée
        let chanson = chansons[indexPath.row]   // récupération de la chanson
        performSegue(withIdentifier: identifiantSegue, sender: chanson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {   // préparation de la Segue pour passer d'un controller à un autre
        if segue.identifier == identifiantSegue {
            if let nouveauController = segue.destination as? VideoController {
                nouveauController.chanson = sender as? Chanson
            }
        }
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
