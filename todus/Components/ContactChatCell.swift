//
//  ContactChatCell.swift
//  todus
//
//  Created by Wilder Lopez on 8/27/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI
//import struct Kingfisher.KFImage

struct ContactChatCell: View {
    @State var name : String
    @State var imgurl : String
    @State var lastMessage : String
    @State var lastMDate : String
    @State var counterMessages : Int
    var body: some View {
        HStack{
//            KFImage(URL(string: imgurl ))
//                .placeholder({
//                    InitialLettersView(size: 60, text: name)
//                })
//                .onSuccess(perform: { _ in
//                    print("img-prof-download->\(self.name)")
//                })
//                .onFailure(perform: { _ in
//                    print("fail img -< \(self.name)")
//                })
                InitialLettersView(size: 60, text: name)
//                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                HStack{
                    Text(name).bold()
                    Spacer()
                    Text(lastMDate).font(.system(size: 15))
                        .foregroundColor(.gray)
                }
                HStack{
                    VStack{
                        Text(lastMessage)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .lineLimit(2)
                    }
                    Spacer()
                    CounterNotification(counter: counterMessages)
                }
            }
            
            Spacer()
        }
    }
}

struct ContactChatCell_Previews: PreviewProvider {
    static var previews: some View {
//        ContactChatCell(name: user.userInfo.alias, imgurl: user.userInfo.pictureUrl, lastMessage: "ultimo mensaje escrito por el usuario ", lastMDate: "9:51 am", counterMessages: Int.random(in: 1...9000))
        Group{
        ContactCell(name: "Wilder Lopez", imgurl: "", subtext: "Yo uso iToDus 😋")
            .previewLayout(.fixed(width: 370, height: 80))
            
        ContactChatCell(name: "Wilder Lopez", imgurl: "", lastMessage: "ultimo mensaje enviado", lastMDate: "9:51 pm", counterMessages: 3)
        .previewLayout(.fixed(width: 370, height: 80))
        }
    }
}

struct ContactCell: View {
    @State var name : String
    @State var imgurl : String
    @State var subtext : String
    var body: some View{
        HStack{
//            KFImage(URL(string: imgurl ))
//                .placeholder({
//                    InitialLettersView(size: 50, text: name)
//                })
//                .onSuccess(perform: { _ in
//                    print("img-prof-download->\(self.name)")
//                })
//                .onFailure(perform: { _ in
//                    print("fail img -< \(self.name)")
//                })
                InitialLettersView(size: 50, text: name)
//                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                HStack{
                    Text(name).bold()
                    Spacer()
                    
                }
                HStack{
                    VStack{
                        Text(subtext)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                            .lineLimit(2)
                    }
                    Spacer()
                    
                }
            }
            
            Spacer()
        }
    }
}
