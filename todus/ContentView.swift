//
//  ContentView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowNotification: Bool = false
   
    
    var body: some View {
        ZStack{
           
            localNotifications(isShowNotification: self.$isShowNotification)
            Home(isShowNotification: self.$isShowNotification)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}
