//
//  UIResponder_Extension.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import UIKit

extension UIResponder {
    
    private struct Static {
        static weak var responder: UIResponder?
    }
    
    static func current() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(
            #selector(UIResponder.trap),
            to: nil, from: nil, for: nil)
        return Static.responder
    }
    
    @objc private func trap() {
        Static.responder = self
    }
}
