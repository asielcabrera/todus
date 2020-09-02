//
//  ImageCell.swift
//  todus
//
//  Created by Wilder Lopez on 8/31/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ImageCell: View {
    
    let item : MediaItemRow
    
//    let image : UIImage
    let date : Date
//    let size : CGSize
    let isCurrentUser: Bool
    
    var width : CGFloat {
        item.image!.size.width
    }
    var height : CGFloat {
        item.image!.size.height
        
    }
    var isLandscape: Bool {
        item.size.width > item.size.height
    }
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing){
            Image(uiImage: item.image!)
                .resizable()
                .aspectRatio(width / height, contentMode: isLandscape ? .fit : .fill)
                .frame(width: isLandscape ? 300 : 250, height: isLandscape ? nil :  350)
            
            DateCheckMarkView(isCurrentUser: isCurrentUser, date: date)
                .padding(3)
                .padding(.horizontal, 6)
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
                .padding(10)
            
            
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
