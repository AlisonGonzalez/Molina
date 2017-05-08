//
//  ListaPodcastTableViewController.swift
//  CONCEPTO
//
//  Created by Alfredo on 3/21/17.
//  Copyright © 2017 Alfredo. All rights reserved.
//

import UIKit

class SeleccionPodcast2TableViewController: UITableViewController, UISearchBarDelegate {
    
    //Definir direccion
    let direccion = "http://conceptoradial.000webhostapp.com/json/podcasts3.json"
    
    private let datos = ["Podcast1","Podcast2","Podcast3"]
    
    //Definir json estatico
    let datosJSON = "[ {\"nombre\": \"Podcast1\",\"podcasts\": \"[{\"título\": \"pod1\", \"URL\": \"http://mx.ivoox.com/es/sintonia-capital-seguridad-mexico-14-mar_mf_17565955_feed_1.mp3?_=1\"}]\"}]"
    
    //Definir nuevo arreglo
    var nuevoArray:[Any]?
    
    //Elementos barra de buscar
    /* Primera version
     var barraControlador: UISearchController!
     var resultadosControlador = UITableViewController()
     */
    //Segunda vers
    @IBOutlet weak var barraBuscar: UISearchBar!
    
    
    var buscando = false
    var infoFiltrada:[Any]?
    
    
    //Convertir json en diccionario
    func JSONParseArray(_ string: String) -> [AnyObject]{
        if let data = string.data(using: String.Encoding.utf8){
            do{
                if let array = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [AnyObject]{
                    return array
                }
            }catch{
                print("Error")
            }
        }
        return [AnyObject]()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //Convertir string en url
        let url = URL(string: direccion)
        
        //Obtener contenido de la nube
        let datos = try? Data(contentsOf: url!)
        nuevoArray = try! JSONSerialization.jsonObject(with: datos!) as? [Any]
        
        //Elementos barra de búsqueda
        /* Primera version
         self.barraControlador = UISearchController(searchResultsController: self.resultadosControlador)
         self.tableView.tableHeaderView = self.barraControlador.searchBar
         */
        //Segunda vers
        barraBuscar.delegate = self
        barraBuscar.returnKeyType = UIReturnKeyType.done
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //barra de busqueda
        if buscando {
            return (infoFiltrada?.count)!
        }
        return (nuevoArray?.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NombrePodcast", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        
        //Obtener fila
        //let objetoPodcast = nuevoArray?[indexPath.row] as! [String: Any]
        var objetoPodcast = nuevoArray?[indexPath.row] as! [String: Any]
        
        //Barra de busqueda
        if buscando {
            objetoPodcast = infoFiltrada?[indexPath.row] as! [String: Any]
        } else {
            objetoPodcast = nuevoArray?[indexPath.row] as! [String: Any]
        }
        
        //Determinar el valor del renglon
        let s: String = objetoPodcast["nombre"] as! String
        
        
        cell.textLabel?.text = s
        
        return cell
    }
    
    //barra de busqueda
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if barraBuscar.text == nil || barraBuscar.text == "" {
            buscando = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            
        } else {
            buscando = true
            
            //Any es $0, String? es barraBuscar.text
            infoFiltrada = nuevoArray?.filter({ $0 as! String == barraBuscar.text })
            
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let siguienteVista = segue.destination as! SeleccionProgramaTableViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        
        //siguienteVista.marca = datos[indice!]
        let objetoMarca = nuevoArray?[indice!] as! [String: Any]
        let s =  objetoMarca["nombre"]
        siguienteVista.tipo = s as! String
    }
}
