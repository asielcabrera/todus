//
//  Contacts.swift
//  todus
//
//  Created by Asiel Cabrera on 9/2/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import SwiftUI
import Contacts

struct Contacts: View {
    
    private var contacts: [ContactRequest] = ContactsStore().fetchContacts()
    private var data: MockUser = DataSource.mockusers[4]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .leading) {
                HStack(spacing: 12){
                    InitialLettersView(size: 60, text: "New Contact")
                        .frame(width: 60, height: 60, alignment: .center)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        HStack{
                            Text("New Contact").bold()
                            Spacer()
                            
                        }
                        HStack{
                            VStack{
                                Text("contact.telephone")
                                    .font(.system(size: 15))
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }
                            Spacer()
                            
                        }
                    }
                    Spacer()
                }.padding(.vertical, 5)
                    .padding(.horizontal, 10)
                ForEach(self.contacts, id: \.self){ contact in
                    HStack(spacing: 12){
                        
                        
                        if self.data.avatar != "" {
                            Image(self.data.avatar)
                                .resizable()
                                .frame(width: 55, height: 55)
                        } else {
                            InitialLettersView(size: 60, text: "\(contact.firstName) \(contact.lastName)")
                                .frame(width: 60, height: 60, alignment: .center)
                                .clipShape(Circle())
                        }
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text("\(contact.firstName) \(contact.lastName)").bold()
                                Spacer()
                                
                            }
                            HStack{
                                VStack{
                                    Text(contact.telephone)
                                        .font(.system(size: 15))
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                }
                                Spacer()
                                
                            }
                        }
                        Spacer()
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                }
            }
        }.padding(.top, 10)
    }
    
}

struct Contacts_Previews: PreviewProvider {
    static var previews: some View {
        Contacts()
    }
}


