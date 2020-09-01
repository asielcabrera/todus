//
//  MockMessage.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

struct MockMessage : Identifiable{
    static func == (lhs: MockMessage, rhs: MockMessage) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id : String
    var kind : MessageKind
    let mockuser: MockUser
    let createAt : Date
    
}
