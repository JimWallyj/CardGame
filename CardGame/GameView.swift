//
//  GameView.swift
//  CardGame
//
//  Created by Jim Walejko on 3/23/26.
//

import SwiftUI

struct GameView: View {
    @State private var cards: [Card] = []
    @State private var player1Cards: [Card] = []
    @ State private var selectedCard = Card(suit: .hearts, rank: .queen)  //  value doesn't matter = we'll change this in .onAppear when we pick our first random card.
    
    var body: some View {
        VStack {
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]){
                    ForEach(cards) { card in
                        
                        CardView(card: card, fontSize: 20, cardWidth: 50, cardHeight: 75)
                    }
                }
                
            } //  SV
           
            CardView(card: selectedCard, fontSize: 50, cardWidth: 100, cardHeight: 150)
        
            ScrollView(.vertical){
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 66))]){
                    ForEach(player1Cards) { playerCard in
                        
                        CardView(card: playerCard, fontSize: 20, cardWidth: 66, cardHeight: 100)
                            .onTapGesture {
                                if playerCard.suit == selectedCard.suit || playerCard.type == selectedCard.type{
                                    //  Find tapped card in the player1CardsArray
                                    if let selectedIndex = player1Cards.firstIndex(where: {$0.id == playerCard.id}){
                                        selectedCard = player1Cards.remove(at: selectedIndex)
                                    }
                                }
                            }
                    }
                }
                
            } //  SV
            
            Button("Pick a Card") {
                guard !cards.isEmpty else {return}  //  Make sure cards array isn't empty
                let randomIndex = Int.random(in: 0...cards.count-1)
                player1Cards.insert(cards.remove(at: randomIndex), at: 0)
                //player1Cards.append(cards.remove(at: randomIndex))
            }
            .font(.title2)
            .tint(.red)
            
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
            
            cards.shuffle()  //  shuffles the deck
            
            selectedCard = cards.removeFirst()  //  picks "random" card from first card
            print("Deck count: \(cards.count)")
            
            //  Deal 5 cards
            for i in 0...4{
                player1Cards.append(cards.removeFirst())
            }
            print("Deck count: \(cards.count)")
            
        }  //  OA
    }
}

#Preview {
    GameView()
}
