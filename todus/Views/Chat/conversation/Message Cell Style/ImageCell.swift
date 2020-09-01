//
//  ImageCell.swift
//  todus
//
//  Created by Wilder Lopez on 8/31/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ImageCell: View {
    let image : UIImage
    let date : Date
    let size : CGSize
    let isCurrentUser: Bool
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Image(uiImage: image)
                .resizable()
                .frame(width: size.width, height: size.height, alignment: .center)
//                .scaledToFill()
            
                    DateCheckMarkView(isCurrentUser: isCurrentUser, date: date)
                        .padding(3)
                        .padding(.horizontal, 6)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(10)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
            
            
        }
        .background(isCurrentUser ? Color.primaryTodusColor : Color.secondaryBubbleColor)
            
        .clipShape(CustomChatCorner(isCurrentUser: self.isCurrentUser))
        .foregroundColor(.white)
        .frame(maxWidth: 300, alignment: isCurrentUser ? .trailing : .leading)
    }
}

//struct ImgCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ImgCell()
//    }
//}
