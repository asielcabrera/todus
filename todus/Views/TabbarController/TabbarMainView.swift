//
//  TabbarMainView.swift
//  todus
//
//  Created by Wilder Lopez on 8/27/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct TabbarMainView: View {
    @State var tabSelection = 0
    @State var navTitles : [String] = ["Contactos", "Chats", "Ajustes"]
    
    var body: some View {
        NavigationView{
        TabView(selection: $tabSelection){
            
//            ContactsView()
            Chats(expand: Binding<Bool>.constant(false)).tabItem {
                Text(navTitles[0])
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 25))
            }.tag(0)
            
//            ChatsView()
                Groups().tabItem {
                Text(navTitles[1])
                Image(systemName: "bubble.left.and.bubble.right.fill")
                    .font(.system(size: 25))
            }.tag(1)
            
//            SettingsView()
                Settings().tabItem {
                Text(navTitles[2])
                Image(systemName: "gear")
                    .font(.system(size: 25))
            }.tag(2)
        }
        .onAppear(perform: {
//                TodusDefaults.lastVCIdentifier = .CHAT_LIST
            })
            .navigationBarTitle("\(navTitles[self.tabSelection])", displayMode: .inline)
        }
    //old navigationview
    .navigationBarTitle("", displayMode: .inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarHidden(true)
        
    }
}

struct TabbarMainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TabbarMainView()
        }
    }
}

