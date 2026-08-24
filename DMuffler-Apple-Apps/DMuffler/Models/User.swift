//  User.swift
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-23
//  For support email dev@evcustoms.store

import Foundation

/**
 Represent a user profile and their associated registered vehicles within a DMuffler app.

 - Parameters:
   - id: The unique identifier for the user profile instance (Satisfies Identifiable protocol)
   - firstName: The user's given name.
   - phoneNumber: The numeric contact phone number formatted as an unsigned 32-bit integer. 15551112222
   - vehicles: A list of VINs associated with a user's account.
 */
struct User: Identifiable{
    var id: UUID =  UUID() // TODO Remove this later after SwiftData library creates them

    var firstName: String
    var phoneNumber: UInt32
    var vehicles: [String]
}
