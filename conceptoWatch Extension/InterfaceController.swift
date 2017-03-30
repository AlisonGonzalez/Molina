//
//  InterfaceController.swift
//  conceptoWatch Extension
//
//  Created by Alfredo on 3/4/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var laTable: WKInterfaceTable!
    
    var nuevoArray:[Any]?
    let datosJSON = "[ {\"nombre\": \"Sintonía Capital\", \"subnombre\": \"Sintonía Capital y las vibraciones\",\"descripcion\": \"http://mx.ivoox.com/es/sintonia-capital-seguridad-mexico-14-mar_mf_17565955_feed_1.mp3?_=1\"}]"
    
    
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            
            do{
                
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                
                print("error")
                //handle errors here
                
            }
        }
        return [AnyObject]()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        nuevoArray=JSONParseArray(datosJSON)
        // Configure interface objects here.
    }
    
   
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        laTable.setNumberOfRows(nuevoArray!.count, withRowType: "renglones")
        for indice in 0 ..< nuevoArray!.count {
            let elRenglon=laTable.rowController(at: indice) as! controladorRenglon
            let objetoMarca = nuevoArray?[indice] as! [String: Any]
            let m=objetoMarca["nombre"] as! String
            let s=objetoMarca["subnombre"] as! String
            elRenglon.name.setText(m)
            elRenglon.subname.setText(s)
            
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        let objetoMarca = nuevoArray?[rowIndex] as! [String: Any]
        let n=objetoMarca["nombre"] as! String
        let d=objetoMarca["descripcion"] as! String
        let cl=PodcastTable(elnombre: n, ladescripcion: d)
        return cl
    }
    

}
