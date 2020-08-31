//
//  ScrollToBottom.swift
//  todus
//
//  Created by Wilder Lopez on 8/30/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation
import SwiftUI
import Introspect

extension View{
    
    public func ScrollToBottom(tableview : UITableView){
        let lastRow = tableview.numberOfRows(inSection: 0) - 1
        tableview.scrollToRow(at: IndexPath(row: lastRow, section: 0), at: .bottom, animated: true)
    }
}

//struct ScrollToBottomModifier : ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .introspectTableView{ (tableview) in
//                let lastRow = tableview.numberOfRows(inSection: 0) - 1
//                tableview.scrollToRow(at: IndexPath(row: lastRow, section: 0), at: .bottom, animated: true)
//        }
//    }
//}
