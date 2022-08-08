//
//  Pokemon.swift
//  PokemonSwiftUI
//
//  Created by Tetiana Borysova on 08.08.22.
//

import Foundation

struct Pokemon: Identifiable{
    var id: Int
    var name: String
    var imageName: String
    var type: String
    var hp: Int
    var attack: Int
    var defense: Int
}

let pokemons = [
    Pokemon(id: 0, name:"Charmander",imageName:"charmander",type:"firetype",hp:39,attack:52, defense:43),
                Pokemon(id: 1, name:"Bulbasaur",imageName:"pokemon",type:"grasstype",hp:45,attack:34, defense:43),
                Pokemon(id: 3, name:"Pikachu",imageName:"pikachu",type:"electrictype",hp:45,attack:46, defense:32)]
