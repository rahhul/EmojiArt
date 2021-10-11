//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Rahul on 10/10/21.
//

import SwiftUI


class EmojiArtDocument: ObservableObject {
    
    @Published private(set) var emojiArt: EmojiArtModel
    
    init() {
        self.emojiArt = EmojiArtModel()
        self.emojiArt.addEmoji("🤨", at: (x: -200, y: -100), size: 80)
        self.emojiArt.addEmoji("😨", at: (x: 50, y: 100), size: 40)
    }
    
    var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
    var background: EmojiArtModel.Background { emojiArt.background }
    
    
    
    
    //MARK: - INTENT(S)
    
    func setBackground(_ background: EmojiArtModel.Background) {
        emojiArt.background = background
    }
    
    func addEmoji(_ emoji: String, at location: (x: Int, y: Int), size: CGFloat) {
        emojiArt.addEmoji(emoji, at: location, size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrAwayFromZero))
        }
    }
    
}



