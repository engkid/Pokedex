//
//  Pokemon.swift
//  Pokedex
//
//  Created by Engkit Satia Riswara on 28/02/19.
//  Copyright © 2019 Engkit Satia Riswara. All rights reserved.
//

import Foundation
import UIKit

struct EvolutionChain {
    
    var evolutionArray: [[String:AnyObject]]?
    var evolutionIds = [Int]()
    
    init(evolutionArray: [[String:AnyObject]]) {
        
        self.evolutionArray = evolutionArray
        self.evolutionIds = setEvolutionIds()
        
    }
    
    func setEvolutionIds() -> [Int] {
        
        var results = [Int]()
        
        evolutionArray?.forEach({ (dictionary) in
            
            if let idString = dictionary["id"] as? String {
                
                guard let id = Int(idString) else { return }
                
                results.append(id)
                
            }
            
        })
        
        return results
        
    }
    
}

struct PokemonDecodable: Decodable {
    
    let name: String?
    let imageUrl: String?
    let weight: Int?
    let height: Int?
    let defense: Int?
    let attack: Int?
    let description: String?
    let type: String?
    let evolutionChain: [EvolutionChains]?
    
}

struct EvolutionChains: Decodable {
    
    let id: String?
    let name: String?
    
}

class Pokemon {
    
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    var baseExperience: Int?
    var evolutionChain: [[String:AnyObject]]?
    var evoArray: [Pokemon]?
    
    init(id: Int, dictionary: [String:AnyObject]) {
        
        self.id = id
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let imageUrl = dictionary["imageUrl"] as? String {
            self.imageUrl = imageUrl
        }
        
        if let weight = dictionary["weight"] as? Int {
            self.weight = weight
        }
        
        if let height = dictionary["height"] as? Int {
            self.height = height
        }
        
        if let defense = dictionary["defense"] as? Int {
            self.defense = defense
        }
        
        if let attack = dictionary["attack"] as? Int {
            self.attack = attack
        }
        
        if let description = dictionary["description"] as? String {
            self.description = description
        }
        
        if let type = dictionary["type"] as? String {
            self.type = type
        }
        
        if let evolutionChain = dictionary["evolutionChain"] as? [[String:AnyObject]] {
            self.evolutionChain = evolutionChain
        }
        
    }
    
}
