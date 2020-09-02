//
//  DataSource.swift
//  todus
//
//  Created by Wilder Lopez on 8/28/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation
import UIKit


///Sample data for testing 
struct DataSource {
    static let mockusers = [
                            MockUser(name: "Rosse🍒", avatar: "p1", isCurrentUser: false),
                            MockUser(name: "Emily", avatar: "p1", isCurrentUser: true),
                            MockUser(name: "Jonh", avatar: "p2", isCurrentUser: true),
                            MockUser(name: "Catherine", avatar: "p3", isCurrentUser: true),
                            MockUser(name: "Emma", avatar: "", isCurrentUser: true),
                            MockUser(name: "Lina", avatar: "p5", isCurrentUser: true),
                            MockUser(name: "Steve Jobs", avatar: "p6", isCurrentUser: true),
                            MockUser(name: "Roy", avatar: "p7", isCurrentUser: true),
                            MockUser(name: "Julia", avatar: "p1", isCurrentUser: true),
                            MockUser(name: "Watson", avatar: "p2", isCurrentUser: true),
                            MockUser(name: "Kavuya", avatar: "p3", isCurrentUser: true),
                            MockUser(name: "Julie", avatar: "p4", isCurrentUser: true),
                            MockUser(name: "Lisa", avatar: "p5", isCurrentUser: true),
                            MockUser(name: "Me😎", avatar: "p7", isCurrentUser: true)
    ]
    static let you = DataSource.mockusers[0]
    static let me = DataSource.mockusers.last
    
    static var mockmessages = [
        MockMessage(id: UUID().uuidString, kind: .text("Hola"), mockuser: DataSource.mockusers[0], createAt: Date()),
        MockMessage(id: UUID().uuidString, kind: .text("Que tal, todo bien ?"), mockuser: DataSource.mockusers[1], createAt: Date()),
        MockMessage(id: UUID().uuidString, kind: .text("Si, todo excelente 😘! Cuentame algo mas?"), mockuser: DataSource.mockusers[0], createAt: Date()),
        MockMessage(id: UUID().uuidString, kind: .text("Probemos el scrollview a ver que tal y como se ve con mensajes largos"), mockuser: DataSource.mockusers[1], createAt: Date()),
        MockMessage(id: UUID().uuidString, kind: .text("intentemos de nuevo con otro mensaje al final de todo esto"), mockuser: DataSource.mockusers[1], createAt: Date()),
        MockMessage(id: UUID().uuidString, kind: .text("Ehhh ? me voy pa Wasasa 😋"), mockuser: DataSource.mockusers[0], createAt: Date()),
        MockMessage(id: UUID().uuidString, kind: .photo(getMediaItem()), mockuser: DataSource.you, createAt: Date())
    ]
    
    static private func getMediaItem() -> MediaItem {
        let imgmedia = MediaItemRow(url: URL(string: "url"), image: #imageLiteral(resourceName: "p1.png"), placeholderImage: #imageLiteral(resourceName: "p1.png"), size: CGSize(width: 250, height: 250))
        
        return imgmedia
    }
}

struct MediaItemRow : MediaItem{
    var url: URL?
    
    var image: UIImage?
    
    var placeholderImage: UIImage
    
    var size: CGSize
    
    
}

