//
//  ViewController.swift
//  trabalhoIOS
//
//  Created by Faculdade Alfa on 23/02/2019.
//  Copyright © 2019 Faculdade Alfa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var listaCarro = [CarroProperty]()
    
    var tbCarro = CarroHandle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        carregarDados()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaCarro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = listaCarro[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.marcaLbl.text = car.marca
        cell.modelolbl.text = car.modelo
        cell.anoLbl.text = String(car.ano)
        cell.valorLbl.text = String(car.valor)
        
        return cell
    }
    
    func carregarDados() {
        
        let filtro:NSPredicate? = nil
        /*let textoBusca = searchBar.text ?? ""
        if (textoBusca != ""){
            //criando o filtro ( WHERE ) para a busca das pessoas pelo cidade e nome da pessoa, independente da letra maiúscula ou minúscula
            filtro = NSPredicate(format: "marca contains[c] %@ or nome contains[c] %@", textoBusca, textoBusca )
        }*/
        
        
        listaCarro = tbCarro.buscar(filtro: filtro)
        tableView.reloadData()
        
    }

}

