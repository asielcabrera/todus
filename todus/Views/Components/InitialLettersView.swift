//
//  InitialLettersView.swift
//  todus
//
//  Created by Wilder Lopez on 8/27/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct InitialLettersView: View {
    
    @State var size : CGFloat
    @State var text : String
    
     var rRed = Double.random(in: 0...1)
     var rGreen = Double.random(in: 0...1)
     var rBlue = Double.random(in: 0...1)
    var rAlpha = Double.random(in: 0...1)
    
    var isDark : Bool {
        let lum = 0.2126 * rRed + 0.7152 * rGreen + 0.0722 * rBlue
        return lum < 0.5
    }
        var body: some View {
        VStack{
//            let colors = Gradient(colors: [self.getBackColor(rRed: self.rRed, rGreen: self.rGreen, rBlue: self.rBlue, alpha: self.rAlpha) , self.getBackColor(rRed: rRed, rGreen: self.rGreen, rBlue: self.rBlue, alpha: self.rAlpha).opacity(0.3)])
//            let conic = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)
            
            Text("\(InitialsForLetters(letter: text))")
                .font(.system(size: size/3, weight: .bold, design: .rounded))
                .foregroundColor( isDark ? .white : .black)
            .background(
                VStack{
                    
                    return Circle()
                        .frame(width: size, height: size, alignment: .center)
                        .foregroundColor(.clear)
                        .background(RadialGradient(gradient: Gradient(colors: [self.getBackColor(rRed: self.rRed, rGreen: self.rGreen, rBlue: self.rBlue, alpha: self.rAlpha) , self.getBackColor(rRed: rRed, rGreen: self.rGreen, rBlue: self.rBlue, alpha: self.rAlpha).opacity(0.3)]), center: .center, startRadius: 10, endRadius: 60))
//                        .foregroundColor(getBackColor(rRed: rRed, rGreen: rGreen, rBlue: rBlue, alpha: rAlpha))
                }
            )
        }
    }
}

struct InitialLettersView_Previews: PreviewProvider {
    static var previews: some View {
        InitialLettersView(size: 60, text: "Wil Lop")
    }
}

extension InitialLettersView {

func InitialsForLetters(letter : String) -> String{
    var cleanerLetter = letter.components(separatedBy: CharacterSet.symbols).joined()
    
    cleanerLetter = cleanerLetter.isEmpty ? "Sin Nombre" : cleanerLetter.uppercased()
    let split = cleanerLetter.split(separator: Character(" "))
    if split.count == 0{
        return String(letter.prefix(1))
    }
    return split.count > 1 ? "\(split[0].prefix(1))\(split[1].prefix(1))" : "\(split[0].prefix(1))" + "".uppercased()
}
    func getBackColor(rRed: Double, rGreen : Double, rBlue: Double, alpha: Double) -> Color {
        return Color(red: rRed, green: rGreen, blue: rBlue)
    }
    
}
