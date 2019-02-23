//
//  CadastrarViewController.swift
//  trabalhoIOS
//
//  Created by Faculdade Alfa on 23/02/2019.
//  Copyright © 2019 Faculdade Alfa. All rights reserved.
//

import UIKit

class CadastrarViewController: UIViewController {

    @IBOutlet weak var marcaInput: UITextField!
    @IBOutlet weak var modeloInput: UITextField!
    @IBOutlet weak var anoInput: UITextField!
    @IBOutlet weak var valorInput: UITextField!
    
    var viewVariable = ViewController()
    
    var tbCarro = CarroHandle()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cadastrarButton(_ sender: Any) {
        tbCarro.inserir(carro: CarroProperty(marca: marcaInput.text!, modelo: modeloInput.text!, ano: Int16(anoInput.text ?? "0") ?? 0, valor: Double(valorInput.text ?? "0") ?? 0 ))
        self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelarButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
