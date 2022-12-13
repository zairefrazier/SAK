//
//  ContentView.swift
//  SAK
//
//  Created by Zaire on 9/29/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: EmojiMemeryGame
    
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    
                    ForEach(viewModel.caard) { card in
                        CardView(card: card)
                            .aspectRatio(2/3,contentMode: .fit)
                            .onTapGesture {
                                viewModel.chooseCard(card)
                            }
                    }
                    
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal)
    
        
    }
    
}



struct CardView: View {
    
    let card: GameModel<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemeryGame()

        
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
