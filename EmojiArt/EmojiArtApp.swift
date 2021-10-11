//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Rahul on 10/10/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
