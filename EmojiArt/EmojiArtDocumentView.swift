//
//  ContentView.swift
//  EmojiArt
//
//  Created by Rahul on 10/10/21.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    
    @ObservedObject var document: EmojiArtDocument
    
    let defaultEmojiFontSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            documentBody
            palette
        }
    }
    
    private var documentBody: some View {
        GeometryReader { geometry in
            ZStack {
                Color.pink.opacity(0.3)
                ForEach(document.emojis) { emoji in
                    Text(emoji.text)
                        .font(.system(size: fontSize(for: emoji)))
                        .position(position(for: emoji, in: geometry))
                }
            }
        }
    }
    
    //MARK: - Positioning/Sizing Emoji
    
    private func fontSize(for emoji: EmojiArtModel.Emoji) -> CGFloat {
        CGFloat(emoji.size)
    }
    
    private func position(for emoji: EmojiArtModel.Emoji,
                          in geometry: GeometryProxy) -> CGPoint {
        convertFromEmojiCoordinates((x: emoji.x, y: emoji.y), in: geometry)
    }
    
    private func convertFromEmojiCoordinates(_ location: (x: Int, y: Int),
                                             in geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(
            x:  center.x + CGFloat(location.x),
            y: center.y + CGFloat(location.y)
        )
    }
    
    
    
    //MARK: - Palette
    
    private var palette: some View {
        ScrollingEmojisView(emojis: testEmojis)
            .font(.system(size: defaultEmojiFontSize))
    }
    
    let testEmojis = "😀😷🦠💉👻👀🐶🌲🌎🌞🔥🍎⚽️🚗🚓🚲🛩🚁🚀🛸🏠⌚️🎁🗝🔐❤️⛔️❌❓✅⚠️🎶➕➖🏳️"
    
}


//MARK: - Scrolling Emojis View
struct ScrollingEmojisView: View {
    let emojis: String
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis.map { String($0) }, id: \.self) { emoji in
                    Text(emoji)
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
    }
}
