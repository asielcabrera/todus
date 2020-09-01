//
//  CenterView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct CenterView: View {
    @Binding var expand : Bool

    
    var body : some View{
        
        List(DataSource.mockusers){ user in
        
            Group{
                if user.id == DataSource.mockusers[0].id {
                    NavigationLink(destination: ChatView()) {
                        CellView(data : user)
                    }

                    .onAppear {

                        self.expand = true
                    }
                    .onDisappear {

                        self.expand = false
                    }
                }
                else{

                    NavigationLink(destination: ContentMessageView(message: DataSource.mockmessages[0], isCurrentUser: false)) {
                        CellView(data : user)
                    }

                }
            }
        }
            .padding(.top, 20)
            .background(Color.white)
            .clipShape(BorderCircleShape())
        
    }
}

struct CenterView_Previews: PreviewProvider {
    static var previews: some View {
        CenterView(expand: .constant(true))
    }
}

