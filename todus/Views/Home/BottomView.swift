//
//  BottomView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    @Binding var index : Int
    
    var body : some View{
        
        HStack{
            
            Button(action: {
                
                self.index = 0
                
            }) {
                
                Image(systemName: "message.fill")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(self.index == 0 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 10)
            
            Button(action: {
                
                self.index = 1
                
            }) {
                
                Image("group")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(self.index == 1 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 10)
            
            Button(action: {
                
                self.index = 2
                
            }) {
                
                Image("settings")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(self.index == 2 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal)
            }
            
        }.padding(.horizontal, 30)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    }
}


