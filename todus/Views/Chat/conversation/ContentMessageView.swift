//
//  ContentMessageView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ContentMessageView: View {
    @State var message: MockMessage
    @State var isCurrentUser: Bool
    @State var date = Date()
    
    var isDoubleMarcket = true
    
    func messagecell() -> some View{
        
        switch message.kind {
        case .text(let text):
            return TextCell(text: text, date: message.createAt, isCurrentUser: message.mockuser.isCurrentUser).embedInAnyView()
        case.photo(let mediaItem):
            return ImageCell(image: mediaItem.image!, date: message.createAt, size: mediaItem.size, isCurrentUser: message.mockuser.isCurrentUser).embedInAnyView()
//            return TextCell(text: "Not supported yet", date: message.createAt, isCurrentUser: message.mockuser.isCurrentUser)
//        default:
//            return TextCell(text: "unknow message type", date: message.createAt, isCurrentUser: message.mockuser.isCurrentUser)
        }

    }
    
    var body: some View {
        messagecell()
        .padding()
        .background(isCurrentUser ? Color.primaryBubbleColor : Color.secondaryBubbleColor)
        .clipShape(CustomChatCorner(isCurrentUser: self.isCurrentUser))
        .foregroundColor(isCurrentUser ? .white : .black)
        .frame(maxWidth: 300, alignment: isCurrentUser ? .trailing : .leading)
    }
}


struct ContentMessageView_Previews: PreviewProvider {
    @State static var sampleMessage = DataSource.mockmessages[2]
    static var previews: some View {
        ContentMessageView(message: sampleMessage, isCurrentUser: sampleMessage.mockuser.isCurrentUser)
    }
}


    
    

struct DateCheckMarkView: View {
    @State var isCurrentUser : Bool
    @State var date : Date
    var body: some View {
        HStack{
            Text(DateHelper.getDateWith(timeInterval: Int64(date.timeIntervalSince1970)))
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
            .frame(width: 70, alignment: .bottomTrailing)
    }
}
