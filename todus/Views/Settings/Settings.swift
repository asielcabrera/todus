//
//  Settings.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct Settings: View {
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Settings")
                
            }
            
        }
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color.white)
        .clipShape(BorderCircleShape())
        .padding(.bottom, 22)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
