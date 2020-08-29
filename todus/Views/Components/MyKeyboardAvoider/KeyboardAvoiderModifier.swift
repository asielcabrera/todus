//
//  KeyboardAvoiderModifier.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

#if os(iOS)

import SwiftUI
import Combine

public struct KeyboardAvoiderModifier: ViewModifier {
    
    @ObservedObject var keyboardHandler = KeyboardHandler()
    
    public func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHandler.keyboardHeight)
    }
}

extension View {
    public func avoidKeyboard() -> some View {
        modifier(KeyboardAvoiderModifier())
    }
}

#endif
