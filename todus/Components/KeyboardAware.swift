//
//  KeyboardAware.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

public class KeyboardInfo: ObservableObject {
    
    public static var shared = KeyboardInfo()
    
    @Published public var height: CGFloat = 0
    @Published var canScroll = false
    
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIApplication.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIApplication.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        
    }
    
    @objc func keyboardChanged(notification: Notification) {
        //        print("KEYBOARD CHANGE")
        withAnimation{
            if notification.name == UIApplication.keyboardWillHideNotification ||
                notification.name == UIApplication.keyboardDidHideNotification {
                self.height = 0
            } else{
                print("k -> \(notification.name)")
                self.height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
            }
            
            if notification.name == UIApplication.keyboardWillChangeFrameNotification ||
                notification.name == UIApplication.keyboardDidChangeFrameNotification{
                self.canScroll = false
            }
            else if notification.name == UIApplication.keyboardDidChangeFrameNotification ||
                notification.name == UIApplication.keyboardDidShowNotification{
                self.canScroll = true
            }
        }
    }
    
}

struct KeyboardAware: ViewModifier {
    @ObservedObject private var keyboard = KeyboardInfo.shared
    @Binding var isActiveKeyboard : Bool
    
    @State private var canActivate = true
    
    func body(content: Content) -> some View {
        content
            .padding(.bottom, self.keyboard.height)
            .edgesIgnoringSafeArea(self.keyboard.height > 0 ? .bottom : [])
            .animation(.easeOut)
            .onReceive(keyboard.$canScroll) { (P) in
                
                if P{
                    self.isActiveKeyboard = true
                }
        }
    }
}

extension View {
    public func keyboardAware(isActive : Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: KeyboardAware(isActiveKeyboard: isActive))
    }
}

