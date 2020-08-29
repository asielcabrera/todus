//
//  KeyboardAvoider.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

#if os(iOS)

import SwiftUI

public struct KeyboardAvoider<Content:View>: View {
    
    private(set) var content:Content
    
    public init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        
        ScrollView {
            self.content
        }
        .avoidKeyboard()
    }
}

#endif
