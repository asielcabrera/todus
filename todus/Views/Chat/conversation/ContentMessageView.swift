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

    
    var body: some View {
        Text(contentMessage)
            .padding()
            .background(isCurrentUser ? Color("primary") : Color("secondary").opacity(0.5))
            .clipShape(CustomChatCorner(isCurrentUser: self.isCurrentUser))
            .foregroundColor(isCurrentUser ? .white : .primary)
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "Hello word", isCurrentUser: true)
    }
}


    
    
