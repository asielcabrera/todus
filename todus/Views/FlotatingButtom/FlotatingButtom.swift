//
//  FlotatingButtom.swift
//  todus
//
//  Created by Asiel Cabrera on 9/16/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct FlotatingButtom: View {
    
    @State private var showAlert: Bool = false
    @State private var alertLabel: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List(1...20, id: \.self) { i in
                    Text("Item #\(i)")
                        .padding()
                }
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        ExpandableButtomPanel(primaryItem: ExpandableButtomItem(label: "plus.circle.fill", action: { debugPrint("hola mundo") }), secondaryItem: [ExpandableButtomItem(label: "plus.app.fill"), ExpandableButtomItem(label: "plus.square.fill.on.square.fill")])
                            .padding()
                    }
                }
            }
        }.navigationBarTitle("Numbers")
    }
}

struct FlotatingButtom_Previews: PreviewProvider {
    static var previews: some View {
        FlotatingButtom()
    }
}

struct ExpandableButtomItem: Identifiable {
    let id = UUID()
    let label: String
    
    private(set) var action: (() -> Void)? = nil
}

struct ExpandableButtomPanel: View {
    
    
    let primaryItem: ExpandableButtomItem
    let secondaryItem: [ExpandableButtomItem]
    
    private let noop: () -> Void = {}
    private let size: CGFloat = 60
    private var cornerRadius: CGFloat {
        get { size / 2 }
    }
    private let shadowColor = Color.black.opacity(0.4)
    private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
    private let shadowRadius: CGFloat = 3
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack{
            ForEach(secondaryItem) { item in
                Button(action: item.action ?? self.noop, label: {
                    Image(systemName: item.label)
                    
                })
                    .frame(width: self.isExpanded ? self.size : 0, height: self.isExpanded ? self.size : 0)
                
                
            }
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
                self.primaryItem.action?()
            }, label: {
                Image(systemName: primaryItem.label)
                    .foregroundColor(Color.secondaryBubbleColor)
                
            }).padding(.top, 0)
                .frame(width: size, height: size)
            }
        .background(Color.primaryBubbleColor)
        .foregroundColor(Color.secondaryBubbleColor)
        .cornerRadius(cornerRadius)
        .font(.title)
        .shadow(color: shadowColor, radius: shadowRadius, x: shadowPosition.x, y: shadowPosition.y)
        .animation(.easeInOut)
    }
}

