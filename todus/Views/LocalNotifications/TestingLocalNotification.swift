//
//  TestingLocalNotification.swift
//  todus
//
//  Created by Wilder Lopez on 9/16/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct TestingLocalNotification: View {
    @State var show  = false
    var body: some View {
        VStack{
            localNotifications(isShowNotification: $show)
                
            Button(action: {
                withAnimation {
                    
                    self.show.toggle()
                }
            }) {
                Text("show Notification")
            }
        }
    }
}

struct TestingLocalNotification_Previews: PreviewProvider {
    static var previews: some View {
        TestingLocalNotification()
    }
}
