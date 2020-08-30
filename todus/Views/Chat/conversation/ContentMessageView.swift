//
//  ContentMessageView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool

    
    var isDoubleMarcket = true
    
    var body: some View {
        HStack(alignment: .bottom){
        Text(contentMessage)
            
            
            //Date and CheckMars
            HStack{
                Text("9:01 PM")
                Image(systemName: "checkmark").background(isCurrentUser ? Color.primaryBubbleColor : Color.secondaryBubbleColor)
                
                .overlay(
                Image(systemName: "checkmark").offset(x: -3, y: 0)
                    .background(
                        Triangle()
                            .fill(isCurrentUser ? Color.primaryBubbleColor : Color.secondaryBubbleColor)
                        .frame(width: 10, height: 10, alignment: .center)
                        .rotationEffect(Angle(degrees: 180))
                        .offset(x: -4, y: 0)
                            
                        
                    )
                )
            }.font(.system(size: 11))
            
            
        }
        .padding()
        .background(isCurrentUser ? Color.primaryBubbleColor : Color.secondaryBubbleColor)
        .clipShape(CustomChatCorner(isCurrentUser: self.isCurrentUser))
        .foregroundColor(isCurrentUser ? .white : .black)
//        .padding(10)
//        .foregroundColor(isCurrentUser ? Color.white : Color.black)
//        .background(isCurrentUser ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
//        .cornerRadius(10)
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "Hello word", isCurrentUser: false)
    }
}


    
    
