//
//  InputMessageBar.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct InputMessageBar: View {
    @Binding var typingMessage: String
    @EnvironmentObject var chatHelper: ChatHelper
    
    
    
    var body: some View {
        HStack {
            MultilineTextField("Message...", text: $typingMessage)
//            TextView(text: $typingMessage)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray))
                .background(Color.white)
//                .frame(minHeight: CGFloat(30))
//            TextField("Message...", text: $typingMessage)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: sendMessage) {
                Text("Send")
            }
        }.frame(minHeight: CGFloat(50))
            .padding(5)
    }
    
    func sendMessage() {
        chatHelper.sendMessage(MockMessage(content: typingMessage, mockuser: DataSource.mockusers[1]))
        typingMessage = ""
    }
}

struct InputMessageBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.red
            InputMessageBar(typingMessage: Binding<String>.constant("asd")).background(Color.white)
        }
    }
}
