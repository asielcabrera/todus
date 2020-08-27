//
//  ContentView.swift
//  todus
//
//  Created by Asiel Cabrera on 8/21/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Msg : Identifiable {
    
    var id : Int
    var name : String
    var msg : String
    var date : String
    var img : String
}

var data = [
    
    Msg(id: 0, name: "Emily", msg: "Hello!!!", date: "22/08/20",img: "p1"),
    Msg(id: 1, name: "Jonh", msg: "How Are You ???", date: "22/08/20",img: "p2"),
    Msg(id: 2, name: "Catherine", msg: "New Tutorial From Kavsoft", date: "20/08/20",img: "p3"),
    Msg(id: 3, name: "Emma", msg: "Hey Everyone", date: "22/08/20",img: "p4"),
    Msg(id: 4, name: "Lina", msg: "SwiftUI Tutorials", date: "22/08/20",img: "p5"),
    Msg(id: 5, name: "Steve Jobs", msg: "New Apple iPhone", date: "15/08/20",img: "p6"),
    Msg(id: 6, name: "Roy", msg: "Hey Guys!!!", date: "22/08/20",img: "p7"),
    Msg(id: 7, name: "Julia", msg: "Hello!!!", date: "22/08/20",img: "p1"),
    Msg(id: 8, name: "Watson", msg: "How Are You ???", date: "22/08/20",img: "p2"),
    Msg(id: 9, name: "Kavuya", msg: "New Tutorial From Kavsoft", date: "20/08/20",img: "p3"),
    Msg(id: 10, name: "Julie", msg: "Hey Everyone", date: "22/08/20",img: "p4"),
    Msg(id: 11, name: "Lisa", msg: "SwiftUI Tutorials", date: "22/08/20",img: "p5"),
    
]

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}


struct msgdataType : Identifiable {
    
    var id : Int
    var msg : String
    var myMsg : Bool
}

// i have already implemented a sample data model.....

var Eachmsg = [
    
    msgdataType(id: 0, msg: "New Album Is Going To Be Released!!!!", myMsg: false),
    
    msgdataType(id: 1, msg: "Discover the innovative world of Apple and shop everything iPhone, iPad, Apple Watch, Mac, and Apple TV, plus explore accessories, entertainment!!!", myMsg: false),
    
    msgdataType(id: 2, msg: "Amazon.in: Online Shopping India - Buy mobiles, laptops, cameras, books, watches, apparel, shoes and e-Gift Cards.", myMsg: false),
    
    msgdataType(id: 3, msg: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.", myMsg: true),
    
    msgdataType(id: 4, msg: "At Microsoft our mission and values are to help people and businesses throughout the world realize their full potential.!!!!", myMsg: false),
    
    msgdataType(id: 5, msg: "Firebase is Google's mobile platform that helps you quickly develop high-quality apps and grow your business.", myMsg: true),
    
    msgdataType(id: 6, msg: "Kavsoft - SwiftUI Tutorials - Easier Way To Learn SwiftUI With Downloadble Source Code.!!!!", myMsg: true)


]
