//
//  ChatTitleView.swift
//  todus
//
//  Created by Wilder Lopez on 9/2/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ChatTitleView: View {
    let image : UIImage
    let name : String
    var width : CGFloat{
        image.size.width
    }
    var height : CGFloat{
        image.size.height
    }
    var isLandscape : Bool{
        width > height
    }
    
    var body: some View {
        HStack(alignment: .center){
            Image(uiImage: image)
                .resizable()
                .aspectRatio( 1 ,contentMode: isLandscape ? .fill : .fit)
                .frame(width: 40, height: 40, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 0){
                Text(name).bold()
                    .font(.system(size: 15))
                Text("Yo uso todus en ios una vez q fui al parque con mis amigos").font(.system(size: 13, weight: .light, design: .default))
                
            }.lineLimit(1)
        }
        .frame(width: 200, alignment: .center)
    }
}

struct ChatTitleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChatTitleView(image: UIImage(named: "p6")!, name: "Steve Jobs")
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: EmptyView(), center:
                
                Button(action: {
                    print("press title view")
                }) {
                    ChatTitleView(image: UIImage(named: DataSource.you.avatar)!, name: "Steve Jobs")
                }.buttonStyle(PlainButtonStyle())
                
                , trailing:
                            
                    Button(action: {
                        print("press trailing item")
                    }) {
                        Image(systemName: "phone")
                            .font(.system(size: 20))
                    }
                    .accentColor(.primaryTodusColor)
                    .padding(.leading, 50)
                
            )
//                .navigationBarItems(trailing:
//                    HStack{
//                        Button(action: {
//                            print("press title view")
//                        }) {
//                            ChatTitleView(image: UIImage(named: DataSource.you.avatar)!)
//                        }.buttonStyle(PlainButtonStyle())
//
//                        Spacer()
//
//                        Button(action: {
//                            print("press trailing item")
//                        }) {
//                            Image(systemName: "phone")
//                                .font(.system(size: 17))
//
//                        }.accentColor(.primaryTodusColor)
//
//                    }
//            )
        }
    }
}
