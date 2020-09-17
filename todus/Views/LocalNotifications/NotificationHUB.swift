//
//  NotificationHUB.swift
//  todus
//
//  Created by Asiel Cabrera on 9/16/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct NotificationHUB: View {
    @State private var showHUD = false
    
    var body: some View {
        ZStack() {
            NHUB(showHUD: self.$showHUD) {
//                aca puedes poner lo que quieras 
                HStack{
                    Image(systemName: "photo")
                    Text("hola mundo")
                }
            }
                .offset(y: showHUD ? -350: -700)
                .animation(.easeOut)
            
            Button("Show Nontificacion"){
                withAnimation{
                    self.showHUD.toggle()
                    self.dismissHUDAfterTime()
                }
                
                
            }
            
            
        }
    }
    
    func dismissHUDAfterTime(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.showHUD = false
        }
    }
}

struct NotificationHUB_Previews: PreviewProvider {
    static var previews: some View {
        NotificationHUB()
    }
}


struct NHUB<Content: View>: View {
    
    @Binding var showHUD: Bool
    let content: () -> Content
    
    init(showHUD: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self._showHUD = showHUD
    }
    
    var body: some View {
        Button(action: {
            withAnimation{
                self.showHUD = false
            }
        }, label: {
            content() // aqui se puede poner lo que quieras
            .foregroundColor(.gray)
            .padding(.horizontal, 10)
            .padding(14)
            .background(Blur(style: .systemMaterial)
                .clipShape(Capsule())
                .shadow(color: Color(.black).opacity(0.22), radius: 12, x: 0, y: 5))
            }).buttonStyle(PlainButtonStyle())
        
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context){
        uiView.effect = UIBlurEffect(style: style)
    }
}
