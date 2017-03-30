//
//  PodcastTable.swift
//  CONCEPTO
//
//  Created by cdt307 on 3/30/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import WatchKit
import UIKit

class PodcastTable: NSObject {
    var nombre:String
    var descripcion:String
    
    
    init(elnombre:String,ladescripcion:String)
    {
        nombre=elnombre
        descripcion=ladescripcion
    }

}
