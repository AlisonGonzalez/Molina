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
    
    @IBAction func playRadio() {
        
    }
    var nuevoArray:[Any]?
    let datosJSON = "[ {\"nombre\": \"Sintonía Capital\", \"subnombre\": \"Sintonía Capital y las vibraciones\",\"descripcion\": \"Revista dedicada a todo lo que pasa en esta loca Ciudad de México entre eventos culturales como festivales de música, cine, libros o exposiciones. También nos ocupamos de temas de movilidad, desarrollo urbano, distribución del agua, urbanización, derechos ciudadanos, energías renovables, alternativas de alimentación sana, deporte en la ciudad, lugares para entretenerse, divertirse y demás; politicas públicas, seguridad, etc., etc., etc.\"},{\"nombre\": \"A Ciencia Cierta\", \"subnombre\": \"Auroras Boreales\",\"descripcion\": \"¿Por qué hay estaciones del año? ¿Cómo funciona el Wi-Fi? ¿Quién es Tesla? ¿Cómo se inventó el excusado? Acompaña a Charly Aguirre descubriendo la ciencia detrás de las cosas más cotidianas, y sobre las cosas que siempre te has preguntado pero nadie te podía explicar. Esto es… ¡A ciencia cierta!\"},{\"nombre\": \"Detrás de Escena\", \"subnombre\": \"Broadway en Protesta\",\"descripcion\": \"El turno musical más teatral de la radio , donde la cuarta pared se rompe al ritmo de los mejores musicales.\"},{\"nombre\": \"Marketeando\", \"subnombre\": \"Entrevista con PayPal\",\"descripcion\": \"Si crees que el secreto de la mercadotecnia es poner cumbia afuera de tu negocio y crees que brand awareness son los premios a las mejores marcas, necesitas escuchar marketeando, una mirada al mundo de la mercadotecnia. Diseñada para mercas y no tan mercas.\"},{\"nombre\": \"Salud con H\", \"subnombre\": \"Alzheimer\",\"descripcion\": \"Descripción no disponible\"},{\"nombre\": \"Wernicke y la Broca\", \"subnombre\": \"Influenza Estacional\",\"descripcion\": \"Programa sobre temas de medicina\"},{\"nombre\": \"Blaring\", \"subnombre\": \"Self Sabotage\",\"descripcion\": \"Blaring; programa de música absolutamente desconocida. Críticos de la cultura popular, que además, dan difusión al talento local.\"},{\"nombre\": \"La Báscula\", \"subnombre\": \"Ergogánicos\",\"descripcion\": \"Descripción no disponible\"},{\"nombre\": \"Medio Actual\", \"subnombre\": \"Programa del 01 de Marzo del 2017\",\"descripcion\": \"Programa noticioso de Concepto Radial… Acompaña a Fernanda Estrada, David Sagarra y Manuel Quero todos los miércoles de 1:30 a 2 p.m. y mantente informado de las últimas noticias nacionales e internacionales antes que nadie.\"},{\"nombre\": \"Shakespeare Inmortal\", \"subnombre\": \"MacBeth y las Brujas\",\"descripcion\": \"Descripción no disponible\"},{\"nombre\": \"De Ida y Vuelta\", \"subnombre\": \"Agua y Cambio Climático\",\"descripcion\": \"Descripción no disponible\"},{\"nombre\": \"La Minuta\", \"subnombre\": \"Trump, Gasolinazo y #SinVotoNoHayDinero\",\"descripcion\": \"Programa de análisis económico, político y social con Mariel Padilla, Carlos Moreno, Emilio Rosillo y Erick Rosas. La economía como nunca la habías entendido. Sintonízanos todos los miércoles a las 2 p.m.\"},{\"nombre\": \"Medio Equis\", \"subnombre\": \"Predicciones para los Premios Oscar\",\"descripcion\": \"Programa radiofónico estudiantil transmitido por la estación Concepto Radial (del Instituto Tecnológico y de Estudios Superiores de Monterrey Campus Ciudad de México) que trata temáticas relacionadas con la Comunicación y los Medios a partir de una visión crítica y global.\"}]"
    
    
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
        laTable.setNumberOfRows(nuevoArray!.count, withRowType: "Podcast")
        for indice in 0 ..< nuevoArray!.count {
            let elRenglon=laTable.rowController(at: indice) as! controladorRenglon
            let objetoMarca = nuevoArray?[indice] as! [String: Any]
            let marca=objetoMarca["nombre"] as! String
            let agencia=objetoMarca["subnombre"] as! String
            elRenglon.name.setText(marca)
            elRenglon.subname.setText(agencia)
            
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        let objetoMarca = nuevoArray?[rowIndex] as! [String: Any]
        let m=objetoMarca["nombre"] as! String
        let a=objetoMarca["descripcion"] as! String
        let c=PodcastTable(elnombre: m, ladescripcion: a)
        return c
    }
    


}
