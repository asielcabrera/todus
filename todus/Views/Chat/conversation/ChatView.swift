//
//  ChatView.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI
import Combine

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
        VStack {
           List {
               ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                  MessageView(currentMessage: msg)
                }
           }
           HStack {
               TextField("Message...", text: $typingMessage)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
                  .frame(minHeight: CGFloat(30))
                Button(action: sendMessage) {
                    Text("Send")
                 }
            }.frame(minHeight: CGFloat(50)).padding()
        }
            .navigationBarTitle(Text(DataSource.mockusers[0].name), displayMode: .inline)
        }
    }
    
    
    func sendMessage() {
        chatHelper.sendMessage(MockMessage(content: typingMessage, mockuser: DataSource.mockusers[1]))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
