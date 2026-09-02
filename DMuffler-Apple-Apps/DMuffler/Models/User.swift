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
import CoreLocation             // Used to determine which country a User is in
//import MapKit                   // Added import for MKReverseGeocodingRequest and MKGeocoder

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
    var phoneNumber: String
    var vehicles: [String]
    // TODO var profilePicture = Image(systemName: "person.crop.circle.fill").symbolRenderingMode(.palette).foregroundStyle(Color.gray, Color.gray.opacity(0.25)).font(.system(size: 64))  • Profile Picture:  \(profilePicture)
    
    // TODO https://share.gemini.google/iUXotyL5zLNx
    // Private initializer ensures instances are only created via the validated factory method
    private init(id: UUID = UUID(), firstName: String, phoneNumber: String, vehicles: [String]) {
        self.id = id
        self.firstName = firstName
        self.phoneNumber = phoneNumber
        self.vehicles = vehicles
    }

    static func create(firstName: String, phoneNumber: String, vehicles: [String], location: CLLocation) async -> UserAsset? {
        guard await isValidPhoneNumber(input: phoneNumber, location: location) else {
            return nil
        }
        
        return UserAsset(firstName: firstName, phoneNumber: phoneNumber, vehicles: vehicles)
    }
    
    
    var description: String {
        """
        👤 Debug User Info:
          • Name:  \(firstName)
          • Cell Phone:  \(phoneNumber)
          • Vehicle VIN's: \(vehicles)

        """
    }

}


/**
 Validates a phone number based on the user's GPS location by determining the country and delegating to the appropriate validator.

 This function uses CLGeocoder to determine the country from the provided CLLocation, then calls the respective validator for the US, Canada, Mexico, Japan, or Germany. If the country is unsupported, it returns false.

 - Parameters:
    - input: The phone number string to validate.
    - location: The user's current geographic location.
 - Returns: The validation result (`true` or `false`)
 */
func isValidPhoneNumber(input: String, location: CLLocation) async -> Bool {
    let geocoder = CLGeocoder()
    
    do {
        let placemarks = try await geocoder.reverseGeocodeLocation(location)
        
        guard let placemark = placemarks.first else {
            return false
        }
        
        // Option A: Check by country name
        if let isoCode = placemark.isoCountryCode?.uppercased() {
            switch isoCode {
            case "US":
                return isValidUSPhoneNumber(input: input)
            case "CA":
                return isValidCanadaPhoneNumber(input: input)
            case "MX":
                return isValidMexicoPhoneNumber(input: input)
            case "JP":
                return isValidJapanPhoneNumber(input: input)
            case "DE":
                return isValidGermanyPhoneNumber(input: input)
            default:
                // TODO DISPLAY MESSAGE THAT COUNTRY IS NOT SUPPORTED
                return false
            }
        }
        return false
        
    } catch {
        return false
    }
} // END FUNC


/**
 Validates whether a given string is a valid U.S. phone number in common formats.

 This function uses a regular expression pattern to check if the input string matches
 standard U.S. phone number formats. Supported formats include numbers with or without
 country code (+1 or 1), optional parentheses around the area code, and various
 separators such as spaces, hyphens, or periods.

 - Parameter input: The phone number string to validate.
 - Returns: `true` if the input matches a valid U.S. phone number format; otherwise, `false`.

 */
func isValidUSPhoneNumber(input: String) -> Bool {
    let pattern = #"^\+?1?\s*\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$"#
    return input.range(of: pattern, options: .regularExpression) != nil
}

/**
 Validates whether a given string is a valid Mexican phone number in common formats.

 This function uses a regular expression pattern to check if the input string matches
 typical Mexican phone number formats (with or without country code, optional spacing).

 - Parameter input: The phone number string to validate.
 - Returns: `true` if the input matches a valid Mexican phone number format; otherwise, `false`.
 */
func isValidMexicoPhoneNumber(input: String) -> Bool {
    let pattern = #"^(\+52)?\s*\d{2,3}\s*\d{4}\s*\d{4}$"#
    return input.range(of: pattern, options: .regularExpression) != nil
}

/**
 Validates whether a given string is a valid Canadian phone number in common formats.

 Canada uses the North American Numbering Plan (NANP), so this function is similar to US validation.

 - Parameter input: The phone number string to validate.
 - Returns: `true` if the input matches a valid Canadian phone number format; otherwise, `false`.
 */
func isValidCanadaPhoneNumber(input: String) -> Bool {
    let pattern = #"^\+?1?\s*\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$"#
    return input.range(of: pattern, options: .regularExpression) != nil
}

/**
 Validates whether a given string is a valid Japanese phone number in common formats.

 Handles most standard mobile and landline formats (with or without country code, optional dashes or spaces).

 - Parameter input: The phone number string to validate.
 - Returns: `true` if the input matches a valid Japanese phone number format; otherwise, `false`.
 */
func isValidJapanPhoneNumber(input: String) -> Bool {
    let pattern = #"^(\+81[- ]?|0)[789]0[- ]?\d{4}[- ]?\d{4}$|^(\+81[- ]?|0)\d{1,4}[- ]?\d{2,4}[- ]?\d{4}$"#
    return input.range(of: pattern, options: .regularExpression) != nil
}

/**
 Validates whether a given string is a valid German phone number in common formats.

 Accepts common formats including country code (+49), area codes (2-5 digits), and subscriber numbers.

 - Parameter input: The phone number string to validate.
 - Returns: `true` if the input matches a valid German phone number format; otherwise, `false`.
 */
func isValidGermanyPhoneNumber(input: String) -> Bool {
    let pattern = #"^(\+49[ \-]?|0)[1-9][0-9]{1,4}[ \-]?[0-9]{3,}$"#
    return input.range(of: pattern, options: .regularExpression) != nil
}
