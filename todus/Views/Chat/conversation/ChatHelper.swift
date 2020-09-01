//
//  ChatHelper.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Combine
import SwiftUI

class ChatHelper : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = DataSource.mockmessages
    
    func sendMessage(_ chatMessage: MockMessage) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
    }
}
