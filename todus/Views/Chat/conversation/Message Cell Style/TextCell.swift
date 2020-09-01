//
//  TextCell.swift
//  todus
//
//  Created by Wilder Lopez on 8/31/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct TextCell : View {
    var text : String
    var date : Date
    var isCurrentUser: Bool
    
    var body: some View{
        HStack(alignment: .bottom){
            Text(text)
            .multilineTextAlignment(.leading)
            
            //Date and CheckMars
            DateCheckMarkView(isCurrentUser: isCurrentUser, date: date)
        }
        .padding()
        .background(isCurrentUser ? Color.primaryBubbleColor : Color.secondaryBubbleColor)
        .clipShape(CustomChatCorner(isCurrentUser: self.isCurrentUser))
        .foregroundColor(isCurrentUser ? .white : .black)
        .frame(maxWidth: 300, alignment: isCurrentUser ? .trailing : .leading)
    }
}

