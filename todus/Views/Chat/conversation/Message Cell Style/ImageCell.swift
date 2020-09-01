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
        HStack(alignment: .bottom){
            Image(uiImage: image).resizable()
                .frame(width: size.width, height: size.height, alignment: .center)
                .overlay(
                    DateCheckMarkView(isCurrentUser: isCurrentUser, date: date)
                    .offset(x: 150, y: 150)
                )
            
            
        }
    }
}

//struct ImgCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ImgCell()
//    }
//}
