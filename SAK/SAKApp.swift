//
//  SAKApp.swift
//  SAK
//
//  Created by Zaire on 9/29/22.
//

import SwiftUI

@main
struct SAKApp: App {
    
    let game = EmojiMemeryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
