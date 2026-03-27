//
//  CardDataStructures.swift
//  CardGame
//
//  Created by Jim Walejko on 3/24/26.
//

import Foundation

//  An enum named Suits
enum Suits: String, CaseIterable{
    case clubs = "♣️"
    case diamonds = "♦️"
    case hearts = "❤️"
    case spades = "♠️"
}

//  A Rank enum to prevent any incorrect card entries
enum Rank: Int, CaseIterable{
    case ace = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    case jack = 11
    case queen = 12
    case king = 13
    
    var type: String{
        switch self{
        case .ace: return "A"
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        default: return "\(rawValue)"
        }
    }
}

struct Card: Identifiable  {
    let id = UUID().uuidString  //  creates a unique value each time a Card is created
    
    let suit: Suits
    let rank: Rank  //  no longer need value - it's the rawValue of the Rank enum
    
    var type: String {rank.type}
    var value: Int {rank.rawValue}
    
    func printCard(){
        print("\(type)\(suit.rawValue) has value \(value)")
    }
}








//struct CountBadge: View {
//    let diceCount: Int
//    var body: some View {
//        Text("\(diceCount)×")
//            .font(.callout)
//            .fontWeight(.semibold)
//            .padding(.horizontal, 6)
//            .padding(.vertical, 3)
//            .background(.red.opacity(0.2), in: Capsule())
//            .overlay {
//                Capsule().stroke(.red.opacity(0.3), lineWidth: 1)
//            }
//    }
//}
//
//#Preview {
//    CountBadge(diceCount: 3)
//}
