//
//  CellView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var data : MockUser
    @State var lastMessage : String
    @State var lastMDate : String
    @State var counterMessages : Int
    var body : some View {
        
        HStack(spacing: 12){


            if data.avatar != "" {
                Image(data.avatar)
                    .resizable()
                    .frame(width: 55, height: 55)
            } else {
                InitialLettersView(size: 60, text: data.name)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading){
                HStack{
                    Text(data.name).bold()
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
        }.padding(.vertical, 5)
           
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(data: DataSource.mockusers[0],lastMessage: "ultimo mensaje enviado", lastMDate: "9:51 pm", counterMessages: 3)
    }
}
