//
//  VideoController.swift
//  Youtube2
//
//  Created by Kevin Trebossen on 9/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import UIKit
import WebKit   // pour ajouter l'outlet webView

class VideoController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    

    var chanson: Chanson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if chanson != nil {
            chargerVideo(chanson: chanson!)
        }
    }
    
    func chargerVideo (chanson: Chanson) {
        if let url = URL(string: chanson.videoUrl) {
            let requete = URLRequest(url: url)
            webView.load(requete)
        }
    }
}
