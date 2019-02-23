//
//  CarroHandle.swift
//  trabalhoIOS
//
//  Created by Faculdade Alfa on 23/02/2019.
//  Copyright © 2019 Faculdade Alfa. All rights reserved.
//

import UIKit
import CoreData

class CarroHandle {
    private let nomeTabela = "Carro"
    
    private var carros: [NSManagedObject] = []
    
    private var managedObject: NSManagedObjectContext!
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else{
                return
        }
        
        managedObject = appDelegate.managedObjectContext
    }
    
    
    func inserir(carro: CarroProperty){
        
        //carrega do banco de dados a tabela (Entidade)
        guard let tabela = NSEntityDescription.entity(forEntityName: nomeTabela, in: managedObject) else{
            return
        }
        
        //pega a estrutura da tabela e cria um objeto manipulável para inserir dados
        let pes = NSManagedObject(entity: tabela, insertInto: managedObject)
        
        pes.setValue(carro.marca, forKey: "marca")
        pes.setValue(carro.modelo, forKey: "modelo")
        pes.setValue(carro.ano, forKey: "ano")
        pes.setValue(carro.valor, forKey: "valor")
        
        do {
            try managedObject.save()
        }catch let erro as NSError{
            print("Erro ao inserir: \(erro)")
        }
    }
    

    
    func buscar(filtro: NSPredicate?) -> [CarroProperty]{
        carros = []
        var listaCarro = [CarroProperty]()
        
        //carregando a estrutura da tabela do modelo (Model)
        let fechRequest = NSFetchRequest<NSManagedObject>(entityName: nomeTabela)
        
        do{
            //criando uma ORDER pelo nome da pessoa
            let modeloOrdem = NSSortDescriptor(key: "marca", ascending: true)
            
            //adicionando os campos do ORDER na requisição
            fechRequest.sortDescriptors = [modeloOrdem]
            
            //verifica se existe um filtro preenchido, se sim, adiciona na busca
            if let condicao = filtro {
                fechRequest.predicate = condicao
            }
            
            carros = try managedObject.fetch(fechRequest)
        } catch let erro as NSError{
            print("Erro ao buscar: \(erro)")
        }
        
        for registro in carros {
            //carregando o valor dos campos retornados do banco de dados
            let  marca = registro.value(forKey: "marca") as! String
            let modelo = registro.value(forKey: "modelo") as! String
            let ano = registro.value(forKey: "ano") as! Int16
            let valor = registro.value(forKey: "valor") as! Double
            //criando um objeto Pessoa com os dados do banco de dados
            let pes = CarroProperty(marca: marca, modelo: modelo, ano: ano, valor: valor)
            
            //adicionando a pessoa na lista de retorno
            listaCarro.append(pes)
            
            //Forma simplicaficada e direta para adicionar a pessoa na lista de retorno
            /*
             listaPessoa.append(Pessoa(nome: registro.value(forKey: "nome") as! String, cidade: registro.value(forKey: "cidade") as! String))
             */
        }
        return listaCarro
    }
}
