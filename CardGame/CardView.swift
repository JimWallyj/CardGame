//
//  CardView.swift
//  CardGame
//
//  Created by Jim Walejko on 3/29/26.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let fontSize: CGFloat
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.white)
                .overlay{
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.gray, lineWidth: 2)
                }
            Text("\(card.suit.rawValue)\(card.rank.type)")
                .font(Font.system(size: fontSize))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
        .frame(width: cardWidth, height: cardHeight)
    }
}

#Preview {
    CardView(card: Card(suit: .spades, rank: .ace), fontSize: 50, cardWidth: 100, cardHeight: 150)
}
