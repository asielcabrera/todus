//
//  BorderCircleShape.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation
import SwiftUI

struct BorderCircleShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 30, height: 30))
        
        return Path(path.cgPath)
    }
}

struct Rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 55, height: 55))
        return Path(path.cgPath)
    }
}
