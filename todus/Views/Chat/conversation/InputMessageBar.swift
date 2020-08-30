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
        
        VStack(spacing: 0){

        Divider()
            HStack(alignment: .center , spacing: 15) {
            Button(action: {
                
            }) {
                Image(systemName: "paperclip").font(.system(size: 25)).foregroundColor(Color("primary"))
            }
            
            MultilineTextField("Mensaje", text: $typingMessage)
                .padding(.horizontal, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray))
                .background(Color.white)

            ZStack{
                Button(action: {
                    print("microphone pressed")
                }) {
                    Image(systemName: "mic").resizable().frame(width: !typingMessage.isEmpty ? 0 : 20, height: !typingMessage.isEmpty ? 0 : 30, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("primary"))
                }

            Button(action: sendMessage) {
                Image(systemName: "arrow.up")
                .resizable()
                    .frame(width: typingMessage.isEmpty ? 0 : 16, height: typingMessage.isEmpty ? 0 : 18, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.horizontal, 2)
                    .background(Circle().frame(width: typingMessage.isEmpty ? 0 : 35, height: typingMessage.isEmpty ? 0 : 35, alignment: .center).foregroundColor(Color("primary")))
            }

            }
            
        }
            .frame(minHeight: CGFloat(50))
            .padding(3)
            .padding(.horizontal, 10)
//            .accentColor(.red)
            
        }
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
            InputMessageBar(typingMessage: Binding<String>.constant("s")).background(Color.white)
        }
    }
}
