//
//  ChatView.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI
import Combine
import UIKit

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        //  dismiss keyboard when gesture down
        UIScrollView.appearance().keyboardDismissMode = .interactive
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                List(chatHelper.realTimeMessages, id: \.self) { msg in
                    MessageView(currentMessage: msg)
                }.onTapGesture {
                    self.endEditing(true)
                }
                
                
                    InputMessageBar(typingMessage: $typingMessage).environmentObject(chatHelper)
//                .avoidKeyboard()
                
            }
//            .keyboardAdaptive()
            .keyboardAware()
            .navigationBarTitle(Text(DataSource.mockusers[0].name), displayMode: .inline)
//            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
