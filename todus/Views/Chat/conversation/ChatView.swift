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
import Introspect

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    @State var isActiveKeyboard = false
    @State var tableView : UITableView? = nil
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
        //  dismiss keyboard when gesture down
        UIScrollView.appearance().keyboardDismissMode = .interactive
        //        UITableView.appearance()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                List(chatHelper.realTimeMessages) { msg in
                    MessageView(currentMessage: msg)
                }.introspectTableView(customize: { (tableview) in
                    
                    if self.isActiveKeyboard {
                        self.tableView = tableview
                    }
                    self.ScrollToBottom(tableview: tableview)
                })
                    
                    
                    .onTapGesture {
                        self.endEditing(true)
                }
                
                InputMessageBar(typingMessage: $typingMessage).environmentObject(chatHelper)
                
            }
            .keyboardAware(isActive: $isActiveKeyboard.didSet(execute: { (response) in
                if response{
                    if self.tableView != nil {
                        self.ScrollToBottom(tableview: self.tableView!)
                    }
                }
            }))
                .navigationBarTitle(Text(DataSource.mockusers[0].name), displayMode: .inline)
        }
    }
    
    
    
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

