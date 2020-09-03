//
//  Chats.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct Chats: View {
    
    @Binding var expand : Bool
    @Binding var isShowNotification: Bool
    
    var body : some View{
           
           VStack(spacing: 0){
               
            TopView(expand: self.$expand, storyShow: .constant(true), isShowNotification: self.$isShowNotification).zIndex(22)
               
            CenterView(expand: self.$expand).offset(y: -22)
           }
       }
}

struct Chats_Previews: PreviewProvider {
    static var previews: some View {
        Chats(expand: .constant(true), isShowNotification: .constant(false))
    }
}
