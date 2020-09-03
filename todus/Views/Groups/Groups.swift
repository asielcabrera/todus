//
//  Groups.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct Groups: View {
    var body : some View{
        
        GeometryReader{ _ in
            
            VStack(spacing: 0){
                TopView(expand: .constant(true), storyShow: .constant(false), isShowNotification: .constant(false))
                    .zIndex(22)
                    
                    
                Contacts()
                    .offset(y: -8)
            }
            
        }
//        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color.white)
        .clipShape(BorderCircleShape())
        .padding(.bottom, 22)
    }
}

struct Groups_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
    }
}
