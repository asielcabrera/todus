//
//  View++.swift
//  todus
//
//  Created by Wilder Lopez on 8/31/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

extension View{
    func embedInAnyView() -> AnyView {
        return AnyView(self)
    }
}
