//
//  ContentView.swift
//  Memorize
//
//  Created by Taras Buhra on 05.01.2023.
// 54:41    

import SwiftUI

struct ContentView:View{
    var emojis = ["🚗", "🚌", "🏎️", "🚚", "🏍️", "🚠", "🚂", "✈️", "🚀", "🛸", "🚁", "🛶", "🚢",
                  "🚜", "🚲", "🚕", "🚎", "🛴", "🛵", "🛟", "🛥️", "🚑", "🚒", "🚛"]
    
    @State var emojiCount:Int = 4
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
             Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle )
            .padding(.horizontal)
           
        }
        .padding(.horizontal)
    }
    var remove: some View{
        Button(action: {
            if(emojiCount != 0){
                emojiCount -= 1
            }

        }, label: {
            VStack{
                Image(systemName: "minus.circle")
            }
        })
    }
    var add: some View{
        Button(action: {
            if (emojiCount < emojis.count){
                emojiCount += 1
            }

        }, label: {
            VStack{
                Image(systemName: "plus.circle")
            }         })
    }
}


struct CardView:View {
    var content:String
    @State var isFaceUp: Bool = true
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20 )
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .onTapGesture{
             isFaceUp = !isFaceUp
        }
    } 
}

 




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
     
    }
}
