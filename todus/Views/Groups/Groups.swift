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
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Group")
            }
            
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
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
