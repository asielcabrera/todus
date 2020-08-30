//
//  DataSource.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation

///Sample data for testing 
struct DataSource {
    static let mockusers = [MockUser(name: "Rosse🍒", avatar: "", isCurrentUser: false), MockUser(name: "Me😎", avatar: "", isCurrentUser: true)]
    static var mockmessages = [
        MockMessage(content: "Hola", mockuser: DataSource.mockusers[0]),
        MockMessage(content: "Que tal, todo bien ?", mockuser: DataSource.mockusers[1]),
        MockMessage(content: "Si, todo excelente 😘! Cuentame algo mas?", mockuser: DataSource.mockusers[0]),
        MockMessage(content: "Probemos el scrollview a ver que tal y como se ve con mensajes largos", mockuser: DataSource.mockusers[1]),
        MockMessage(content: "intentemos de nuevo con otro mensaje al final de todo esto", mockuser: DataSource.mockusers[1]),
        MockMessage(content: "Ehhh ? me voy pa Wasasa 😋", mockuser: DataSource.mockusers[0]),
    ]
}
