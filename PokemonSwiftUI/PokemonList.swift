//
//  PokemonList.swift
//  PokemonSwiftUI
//
//  Created by Tetiana Borysova on 08.08.22.
//

import SwiftUI

struct PokemonList: View {
    var body: some View {
    NavigationView{
        List(pokemons){ pokemon in
            NavigationLink(destination: PokemonView(pokemon: pokemon)){
             PokemonRow(pokemon: pokemon)
            }
           }
        .navigationBarTitle(Text("Favorite Pokemons"))
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
