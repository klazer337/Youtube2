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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self       // = UITableViewDelegate
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {       // FONCTION OBLIGATOIRE pour se conformer aux protocoles
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //   Quelle cellule renvoyer ou peupler - FONCTION OBLIGATOIRE
        return UITableViewCell()
    }

}
