//
//  MockUser.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

struct MockUser : Hashable, Identifiable {
    
    var id = UUID()
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}


