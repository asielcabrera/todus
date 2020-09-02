//
//  NavigationBarItemExtension.swift
//  todus
//
//  Created by Wilder Lopez on 9/2/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

extension View {
    func navigationBarItems<L, C, T>(leading: L, center: C, trailing: T) -> some View where L: View, C: View, T: View {
        self.navigationBarItems(leading:
            HStack{
                HStack {
                    leading
                }
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .center)
                Spacer()
                HStack {
                    center
                }
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .center)
                Spacer()
                HStack {
                    trailing
                }
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .center)
            }
            .frame(width: UIScreen.main.bounds.width)
        )
    }
}
