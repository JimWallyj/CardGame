//
//  ContentView.swift
//  CardGame
//
//  Created by Jim Walejko on 3/23/26.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = []
    var body: some View {
        VStack {
            
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]){
                    ForEach(cards) { card in
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundStyle(.white)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.gray, lineWidth: 2)
                                }
                            Text("\(card.suit.rawValue)\(card.rank.type)")
                                .font(Font.system(size: 20))
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                        .frame(width: 50, height: 75)
                    }
                }
                
            }
        }
        .padding()
        .onAppear(){
            //  Make sure you don't create the cards deck if there is already something in the deck:
            guard cards.isEmpty else{return}  //  If .onAppear is triggered after cards have been created then the deck won't be populated again.
            for rank in Rank.allCases{  //  go through all 13 ranks
                for suit in Suits.allCases{  //  go through all 4 suits for each rank
                    cards.append(Card(suit: suit, rank: rank))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
