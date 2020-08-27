//
//  Home.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var index = 0
    @State var expand = false
    var body : some View{
          NavigationView {
        ZStack{
            
            VStack{
                Color.white
                Color("primary")
            }
            
            VStack{
                
                ZStack{
                  
                        
                    Chats(expand: self.$expand).opacity(self.index == 0 ? 1 : 0)
                    
                    Groups().opacity(self.index == 1 ? 1 : 0)
                    
                    Settings().opacity(self.index == 2 ? 1 : 0)
                        
                    
                }
                
                BottomView(index: self.$index)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

