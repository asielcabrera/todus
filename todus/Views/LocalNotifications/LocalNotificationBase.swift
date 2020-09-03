//
//  LocalNotificationBase.swift
//  todus
//
//  Created by Asiel Cabrera on 9/3/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//


import SwiftUI

struct localNotificationBase<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
            content()
            .background(RoundedRectangle(cornerRadius: 10)
                .shadow(color: .gray, radius: 2.5, x: 0.6, y: 0)
                .foregroundColor(Color.secondaryBubbleColor)
        )
            
        
        
    }
}
