//  VehicleSounds.swift
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-02
//  For support email dev@evcustoms.store

// Standard libraries
import SwiftData        // Instead of "import Foundation", "SQLite" or "GRDB" (feature-rich SQLite toolkit in Swift)
import Foundation
import DeveloperToolsSupport    // Used to define images in "VehicleAsset" struct


struct VehicleAsset: Identifiable{
    var id: UUID =  UUID() // TODO Remove this later after SwiftData library creates them

    var engineSoundID: Int
    var name: String
    var image: ImageResource
    var sound: URL
}

// image filename must match the exact name in Assets.xcassets in camelCase
let defaultVehicleAsset = VehicleAsset(
    engineSoundID: VehicleModel.F1.rawValue, // or relevant case
    name: "McLaren F1",
    image: .mclarenArtura,
    sound: Bundle.main.url(forResource: "mclarenF1Sound", withExtension: "wav")!
)


func setVehicleAsset(for model: VehicleModel) -> VehicleAsset {
    switch model {
    case .F1:
        return defaultVehicleAsset
    }
}
