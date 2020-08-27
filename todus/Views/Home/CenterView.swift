//
//  CenterView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct CenterView: View {
    @Binding var expand : Bool

    
    var body : some View{
        
        
            List(data){i in
                
                if i.id == 0{
                    NavigationLink(destination: ConversationDetail()) {
                        CellView(data : i)
                    }
                    
                    .onAppear {
                            
                        self.expand = true
                    }
                    .onDisappear {
                        
                        self.expand = false
                    }
                }
                else{
                   
                    NavigationLink(destination: ConversationDetail()) {
                        CellView(data : i)
                    }
                        
                }
                
            }
            .padding(.top, 20)
            .background(Color.white)
            .clipShape(BorderCircleShape())
        
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView(expand: .constant(true))
    }
}

