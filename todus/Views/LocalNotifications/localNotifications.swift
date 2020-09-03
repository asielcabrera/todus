//
//  localNotifications.swift
//  todus
//
//  Created by Asiel Cabrera on 9/2/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct localNotifications: View {
    
    @Binding var isShowNotification: Bool
    @State var ytraslate: CGFloat = -350
    
    var body: some View {
        localNotificationBase {
            HStack(spacing: 0){
                Image(systemName: "music.house")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 50)
                    .padding()
                
                VStack(alignment: .leading){
                    Text("titulo de la noctificacion")
                        .bold()
                        .lineLimit(1)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .padding(.bottom, 5)
                    
                    Text("texto del mensaje que va a llegar segunda linea de texto que no debe de mortrar")
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .padding(.horizontal, 5)
                }
            }.frame(minWidth: UIScreen.main.bounds.width - 40, idealWidth: UIScreen.main.bounds.width - 40, maxWidth: UIScreen.main.bounds.width - 40, minHeight: 100, idealHeight: 100, maxHeight: 100)
            
        }.zIndex(22).offset(y: self.isShowNotification ? self.ytraslate : -UIScreen.main.bounds.height)
            
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onEnded({ value in
                    if value.translation.height < 0 {
                        withAnimation{
                            self.isShowNotification = false
                        }
                    }
                    
                }))
    }
}

struct localNotifications_Previews: PreviewProvider {
    static var previews: some View {
        localNotifications(isShowNotification: .constant(false))
    }
}


