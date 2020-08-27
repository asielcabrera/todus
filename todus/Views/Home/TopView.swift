//
//  TopView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct TopView: View {
    @State var search = ""
    @Binding var expand : Bool
    
    var body : some View{
        
        VStack(spacing: 17){
            
        
            
            
                HStack{
                    
                    Text("Todus")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(Color("secondary").opacity(0.7))
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("menu")
                        .resizable()
                        .frame(width: 20, height: 20)
                            .foregroundColor(Color("secondary").opacity(0.4))
                    }
                }.padding(15)
                .onTapGesture {
                        self.endEditing(true)
                }
                    
                if self.expand{
                                   HStack(spacing: 15){
                                       
                                       Image(systemName: "magnifyingglass")
                                       .resizable()
                                       .frame(width: 18, height: 18)
                                       .foregroundColor(Color.black.opacity(0.3))
                                       
                                       TextField("Search", text: self.$search)
                                       
                                   }.padding()
                                   .background(Color.white)
                                   .cornerRadius(8)
                                   .padding(.bottom, 10)
                                   }
                        
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image(systemName: "plus")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color("secondary"))
                            .padding(18)
                            
                        }.background(Color("secondary").opacity(0.5))
                        .clipShape(Circle())
                        
                        ForEach(1...7,id: \.self){i in
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("p\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 60, height: 60)
                                
                            }
                        }
                    }
                }
                
            
             
        }.padding()
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color("primary"))
        .clipShape(BorderCircleShape())
        .animation(.default)
        .onTapGesture {
                self.endEditing(true)
        }
        
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView(search: "", expand: .constant(false))
    }
}
