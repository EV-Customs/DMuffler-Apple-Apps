//  Vehicle.swift
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-02
//  For support email dev@evcustoms.store

// Standard libraries
import SwiftData                // Instead of "import Foundation", "SQLite" or "GRDB" (feature-rich SQLite toolkit in Swift)
import Foundation
import DeveloperToolsSupport    // Used to define images in "VehicleAsset" struct

// Internal libraries
// NONE

// External libraries
// TODO https://github.com/EV-Customs/DMuffler-PiComputeModule/blob/main/GlobalConstants.py

// Auto-incremented enums (Listed from best (0) to worst (N) :p)
// These enum values will change (WARNING) in source code as more vehicle makes are added and/or reranked
enum VehicleMake: Int, CaseIterable{
    case TESLA = 0
    case APTERA
    case MC_LAREN
    case PORSCHE
    case BMW
    case STAR_WARS
    case JAGUAR
    case KIA
    case RIVIAN
    case FORD
    case VINFAST
}

// Auto-incremented enums, grouped by make (see enum VehicleMake)
// These enum values will change (WARNING) in source code as more models are inserted
enum VehicleModel: Int, CaseIterable {
    // Tesla Models (SEXY CARS)
    case MODEL_S = 0
    case MODEL_3
    case MODEL_X
    case MODEL_Y
    case MODEL_YL
    case CYBERTRUNK
    case ATV
    case ROADSTER_V2
    case SEMI_TESLA
    
    // Aperta Models
    
    // Stars Wars Models
    case POD_RACER

    // BMW models
    case SERIES_2_E     //TODO
    case SERIES_3_E78   //TODO
    case SERIES_5_E     //TODO
    case M3
    case M4
    case M5
    case i8
    
    // Rivian models
    case R1S
    case R1T
    case R2
    case R3
    
    // McLaren models
    case F1
    case ARTURA

    // Porcshe models
    case P_911
    case P_TAYCAN
    
    // Ford models
    case MUSTANG_GT350
    
    // Ferrari models
    case LUCE
    case F80
    case F_GTS
    
}



// Physical hardware CONSTANTS
GO_PEDAL = 0                                                // Pedal furthest right aka "gas pedal"
GO_PEDAL_POSITION_CAN_BUS_IDENTIFIER = [0b11_111_111_111]           #TODO or 29bit?

BRAKE_PEDAL = 1                                             // Pedal furthest left in automatic transmissions vehicles
BRAKE_PEDAL_POSITION_CAN_BUS_IDENTIFIER = [0b11_111_111_111]        #TODO or 29bit?

// Digital simulation of hardware CONSTANTS
TOP_GEAR = 5
MAX_RPM = 10000

// CAN Bus CONSTANTS
VELOCITY_SENSOR_CAN_BUS_IDENTIFIER = [0b111_1111_1111]             #TODO or 29bit?
ENGINE_LOAD_CAN_BUS_IDENTIFIER = [0b111_1111_1111]                 #TODO or 29bit?
RPM_CAN_BUS_IDENTIFIER = [0b111_1111_1111]                         #TODO or 29bit?
ODDOMETER_CAN_BUS_IDENTIFIER = [0b111_1111_1111]                   #TODO or 29bit?
HYBRID_BATTERY_REMAINING_CAN_BUS_IDENTIFIER = [0b111_1111_1111]    #TODO or 29bit?

/**
  Validates whether a given string is a valid 17-character VIN (no production database should ever store an invalid VIN).

 - Parameter input: The VIN string entered by a user.
 - Returns: `true` if the VIN is valid; otherwise, `false`.
 */
func isValidVIN(input: String) -> Bool {
    let validVINCharacters = CharacterSet(charactersIn: "0123456789ABCDEFGHJKLMNPRSTUVWXYZ")  // Excludes (I, O , and Q)
    
    // Check length and ensure uppercase matching against valid characters
    return input.count == 17 && input.uppercased().unicodeScalars.allSatisfy { validVINCharacters.contains($0) }
}


/**
  Checks whether the provided integer maps to a valid `VehicleMake` enum.
 
- Parameter input: The raw integer value to validate against `VehicleMake`.
- Returns: `true` if `input` matches a `VehicleModel` raw value; otherwise, `false`.
*/
func isValidVehicleMake(input: Int) -> Bool {
    return VehicleMake(rawValue: input) != nil
}


/**
  Checks whether the provided integer maps to a valid `VehicleModel` enum.
 
- Parameter input: The raw integer value to validate against `VehicleModel`.
- Returns: `true` if `input` matches a `VehicleModel` raw value; otherwise, `false`.
*/
func isValidVehicleModel(input: Int) -> Bool {
    return VehicleModel(rawValue: input) != nil
}


/**
 Defines a vehicle by its unique identification, make, model, production year, and custom nickname.

 - Parameters:
   - vin: A 17-character Vehicle Identification Number (uppercase alphanumeric, excluding I, O, and Q).
   - make: The manufacturer of the vehicle (`CarMake`).
   - model: The specific model of the vehicle (`CarModel`).
   - year: The model year of the vehicle (between 1885 and the upcoming model year, inclusive).
   - name: A user-assigned custom nickname for the car (e.g., "Kit", "Apollo").
 
   - id: ???? (Satisfies Identifiable protocol)
   - description:
 */
struct Vehicle: Identifiable{
    var vin: String
    var make: VehicleMake
    var model: VehicleModel
    var year: Int
    var name: String
    
    var id = UUID()  // TODO Remove this later after SwiftData library creates them
    
    var description: String {
        """
        🚗 Debug Vehicle Info:
          • Name:  \(name)
          • Make:  \(make)
          • Model: \(model)
          • Year:  \(year)
          • VIN:   \(vin)
        """
    }
}


/**
 Executes test assertions for vehicle data validation functions.

 Tests include:
 - Validating standard 17-character VIN formatting and character exclusion rules (`I`, `O`, `Q`).
 - Validating raw integer mappings against the `CarMake` enum cases.
 - Inspecting the lowest-ranked car make via `CarMake.allCases`.

 - Returns: `true` if all internal assertions pass.
 */
func unitTest() -> Bool {
    assert(isValidVIN(input:  "1HGBH42JXMN123456"))
    assert(!isValidVIN(input: "11111HGBH42JXMN123456"))
    assert(!isValidVIN(input: "QHGBH42JXMN123456"))
    assert(!isValidVIN(input: "H42JXMN123456"))
    assert(isValidVehicleMake(input: 3))
    assert(!isValidVehicleMake(input: 15))
    
    if let lastRankedCarMake = VehicleMake.allCases.last {
        print("EV Customs worst ranked car make is: \(lastRankedCarMake)")
    }
    
    return true

}
