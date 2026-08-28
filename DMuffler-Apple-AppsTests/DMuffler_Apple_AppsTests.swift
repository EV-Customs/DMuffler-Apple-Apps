//  DMuffler_Apple_AppsTests.swift
// DMuffler-Apple-AppsTests
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-02
//  For support email dev@evcustoms.store

import XCTest
@testable import DMuffler_Apple_Apps // Use your app target name

final class CarTests: XCTestCase {

    /*
     Test functions in Vehicle.swift
     */
    func testVehicleValidation() {
        // VIN Assertions
        XCTAssertTrue(isValidVIN(input:  "1HGBH42JXMN123456"))
        XCTAssertFalse(isValidVIN(input: "OHGBH42JXMN123456"))
        XCTAssertFalse(isValidVIN(input: "IHGBH42JXMN123456"))
        XCTAssertFalse(isValidVIN(input: "QHGBH42JXMN123456"))
        XCTAssertFalse(isValidVIN(input: "QHGBH42JXMN123456  "))
        XCTAssertFalse(isValidVIN(input: " QHGBH42JXMN123456"))
        XCTAssertFalse(isValidVIN(input: "H42JXMN123456"))

        // CarMake Assertions
        XCTAssertTrue(isValidVehicleMake(input: 3))
        XCTAssertFalse(isValidVehicleMake(input: 15))
        

        // Enum Inspection
        if let lastRankedCarMake = VehicleMake.allCases.last {
            print("Worst ranked car make: \(lastRankedCarMake)")
        }
    }
    
    /*
     Test functions in User.swift
     */
    func testUserValidation() {
        
        XCTAssertTrue(isValidUSPhoneNumber(input: "555-123-4567"))
        XCTAssertTrue(isValidUSPhoneNumber(input: "(555) 123-4567"))
        XCTAssertTrue(isValidUSPhoneNumber(input: "+1 555 123 4567"))
        XCTAssertFalse(isValidUSPhoneNumber(input: "12345"))

    }
    
}
