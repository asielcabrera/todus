//
//  ContactStore.swift
//  todus
//
//  Created by Asiel Cabrera on 9/2/20.
//  Copyright © 2020 Asiel Cabrera. All rights reserved.
//

import Foundation
import Contacts

struct ContactRequest: Hashable {
    var firstName: String
    var lastName: String
    var telephone: String
}

class ContactsStore {
    public var contacts = [ContactRequest]()
    
    
    func fetchContacts() -> [ContactRequest]{
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request, usingBlock: {
                        (contact, stopPointer) in
                        self.contacts.append(ContactRequest(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                } catch let error{
                    print("Failed to enumerate contacts", error)
                }
            } else {
                print("access denied")
            }
        }
        return self.contacts
    }
}
