//
//  PokemonRow.swift
//  PokemonSwiftUI
//
//  Created by Tetiana Borysova on 08.08.22.
//

import SwiftUI

struct PokemonRow: View {
    
    var pokemon:Pokemon
    
    
    
    var body: some View {
        HStack {
            Image(pokemon.imageName).resizable().frame(width: 100, height: 70)
            Text(pokemon.name).font(.largeTitle)
            Spacer()
            
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    
    
    static var previews: some View {
        VStack {
            PokemonRow(pokemon:pokemons[0]).previewLayout(.fixed(width: 500, height: 70))
            PokemonRow(pokemon:pokemons[1]).previewLayout(.fixed(width: 500, height: 70))
            PokemonRow(pokemon:pokemons[2]).previewLayout(.fixed(width: 500, height: 70))
        }
    }
}
