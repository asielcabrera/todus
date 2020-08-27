//
//  CellView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/22/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var data : Msg
    
    var body : some View {
        
        HStack(spacing: 12){
            
            Image(data.img)
            .resizable()
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 12) {
            
                Text(data.name)
                
                Text(data.msg).font(.caption)
            }
            
            Spacer(minLength: 0)
            
            VStack{
                Spacer()
                
                Text(data.date)
                
                Spacer()
            }
        }.padding(.vertical, 7)
           
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(data: data[0])
    }
}
