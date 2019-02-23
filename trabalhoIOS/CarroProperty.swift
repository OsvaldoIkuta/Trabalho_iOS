//
//  Carro.swift
//  trabalhoIOS
//
//  Created by Faculdade Alfa on 23/02/2019.
//  Copyright © 2019 Faculdade Alfa. All rights reserved.
//


import UIKit

class CarroProperty {
    var marca: String
    var modelo: String
    var ano: Int16
    var valor: Double
    
    init(marca: String, modelo: String, ano: Int16, valor: Double) {
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
    }
    
    
}
