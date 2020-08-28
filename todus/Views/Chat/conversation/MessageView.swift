//
//  MessageView.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    var currentMessage: MockMessage
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if currentMessage.mockuser.isCurrentUser {
                Spacer()
            }
            ContentMessageView(contentMessage: currentMessage.content,
                               isCurrentUser: currentMessage.mockuser.isCurrentUser)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(currentMessage: MockMessage(content: "Hola mundo", mockuser: DataSource.mockusers[0]))
    }
}
