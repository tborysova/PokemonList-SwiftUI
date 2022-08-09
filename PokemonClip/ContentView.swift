//
//  ContentView.swift
//  PokemonClip
//
//  Created by Tetiana Borysova on 09.08.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(pokemons){
            pokemon in PokemonRow(pokemon: pokemon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
