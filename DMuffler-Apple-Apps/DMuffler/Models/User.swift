//  User.swift
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-23
//  For support email dev@evcustoms.store

// Standard libraries
import SwiftData                // Instead of "import Foundation", "SQLite" or "GRDB" (feature-rich SQLite toolkit in Swift)
import Foundation
import DeveloperToolsSupport    // Used to define images in "UserAsset" struct
import SwiftUI                  // Used to define SF Symbols in "UserAsset" struct

// External libraries


/**
 Represent a user profile and their associated registered vehicles within a DMuffler app.

 - Parameters:
   - id: The unique identifier for the user profile instance (Satisfies Identifiable protocol)
   - firstName: The user's given name.
   - phoneNumber: The numeric contact cell phone number formatted as an unsigned 32-bit integer. 15551112222
   - vehicles: A list of VINs associated with a user's account.
 */
struct UserAsset: Identifiable{
    var id: UUID =  UUID() // TODO Remove this later after SwiftData library creates them

    var firstName: String
    var phoneNumber: UInt
    var vehicles: [String]
    // TODO var profilePicture = Image(systemName: "person.crop.circle.fill").symbolRenderingMode(.palette).foregroundStyle(Color.gray, Color.gray.opacity(0.25)).font(.system(size: 64))  • Profile Picture:  \(profilePicture)
    
    var description: String {
        """
        🚗 Debug User Info:
          • Name:  \(firstName)
          • Cell Phone:  \(phoneNumber)
          • Electric & Hybrid Vehicles: \(vehicles)

        """
    }

}



/**
 Validates whether a given string is a valid USA, Mexico, Canada, Japan, Germany (no production database should ever store an invalid phone number).

 - Parameter input: The phone number string entered by a user.
 - Returns: `true` if the phone number is valid; otherwise, `false`.
 */
func isValidPhoneNumber(input: String) -> Bool {
    let validPhoneNumberharacters = CharacterSet(charactersIn: "0123456789+.-()")  // Excludes (I, O , and Q)
    

    // Check length and ensure uppercase matching against valid characters
    return input.count == 9 && input.uppercased().unicodeScalars.allSatisfy { validPhoneNumberharacters.contains($0) }
}
