//
//  Chanson.swift
//  Youtube2
//
//  Created by Kevin Trebossen on 9/09/18.
//  Copyright © 2018 KTD. All rights reserved.
//

import Foundation

class Chanson {
    private var _artiste: String
    private var _titre: String
    private var _code: String
    private var _baseUrlVideo = "https://www.youtube.com/embed/"
    private var _baseUrlMiniature = "http://i.ytimg.com/vi/"
    private var _finUrlMiniature = "/maxresdefault.jpg"
    
    var artiste: String {
        return _artiste
    }
    
    var titre: String {
        return _titre
    }
    
    var code: String {
        return _code
    }
    
    var videoUrl: String {
        return _baseUrlVideo + _code
    }
    
    var miniatureUrl: String {
        return _baseUrlMiniature + _code + _finUrlMiniature
    }
    
    init(artiste: String, titre: String, code: String){
        self._artiste = artiste
        self._titre = titre
        self._code = code
    }
    
}