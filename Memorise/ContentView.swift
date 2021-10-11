//
//  ContentView.swift
//  Memorise
//
//  Created by Shane Walsh on 09/09/2021.
//

import SwiftUI


struct ContentView: View {
    
    @State var cardCount = 6
    @State private var cards: [String] = ["👧🏻", "👦🏿", "👶🏻", "👳🏻‍♀️", "👰🏻‍♂️",  "👩🏿‍🎓"]

    let faces = ["👧🏻", "👦🏿", "👶🏻", "👳🏻‍♀️", "👰🏻‍♂️",  "👩🏿‍🎓", "🤨", "👩🏼‍🌾", "👳🏻", "👱‍♀️"]
    let transport = ["🚝", "✈️", "🛳", "🚎", "🛸", "🚁", "🛶", "🛰", "🚍", "🚀", "🛴", "⛵️"]
    let animals = ["🐵", "🐱", "🐰", "🐹", "🐝", "🦄", "🐥", "🐗", "🦉", "🦗", "🪱", "🦖", "🐙"]

    
    
//    let cardWidth = 1000 / cardCount
    
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundColor(.black)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], content: {
                    ForEach(cards[0..<cardCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                    })
                })
            }
            Spacer()
            selectTheme
                
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        .padding(.top)
            
    
        
}
    
    var add: some View {
        Button {
            if cardCount < cards.count {
                cardCount += 1
            }
            
        } label: {
            Image(systemName: "plus.circle")
        }
        .disabled(cardCount == cards.count)
        .foregroundColor(cardCount == cards.count ? .gray : .blue)
    }
        
    var remove: some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
        .disabled(cardCount == 1)
        .foregroundColor(cardCount == 1 ? .gray : .blue)
    }
    
    var addRemoveButtons: some View {
        HStack {
            remove
            Spacer()
            add
        }
        .padding()
        .font(.largeTitle)
        .foregroundColor(.blue)
    }
    
    func setNewLayout(emoji: [String]) -> Void {
        cards = emoji.shuffled()
        cardCount = Int.random(in: 4...cards.count)
    }
    
    
    var selectTheme: some View {
        LazyVGrid (columns: [GridItem(.adaptive(minimum: 100))], content: {
            Button {
                setNewLayout(emoji: faces)
            } label: {
                VStack {
                    Image(systemName: "person")
                        .font(.largeTitle)
                    Text("Faces")
                        .font(.caption)
                }
            }
            Button {
                setNewLayout(emoji: transport)
                
            } label: {
                VStack {
                    Image(systemName: "car.fill")
                        .font(.largeTitle)
                    Text("Vehicles")
                        .font(.caption)
                }
            }
            Button {
                cards = animals.shuffled()
                cardCount = Int.random(in: 4...animals.count)
                
            } label: {
                VStack {
                    Image(systemName: "hare")
                        .font(.largeTitle)
                    Text("Animals")
                        .font(.caption)
                }
            }
        })
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
    }
        
}



struct CardView: View {
    
    @State private var isFaceUp: Bool = true
    
    var content: String

    var body: some View {
        
        let shape = RoundedRectangle(cornerRadius: 20)
        
        ZStack {
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(Font.largeTitle)
            } else {
                shape.fill()
            }
        }
        .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
        .onTapGesture{
            isFaceUp = !isFaceUp
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
