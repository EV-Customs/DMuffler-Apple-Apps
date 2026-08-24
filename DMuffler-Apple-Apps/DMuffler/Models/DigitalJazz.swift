//  DigitalJazz.swift
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-02
//  For support email dev@evcustoms.store

// Standard libraris
import SwiftData    // Instead of "import Foundation", "SQLite" or "GRDB" (feature-rich SQLite toolkit in Swift)
import Foundation
import DeveloperToolsSupport    // Used to define images in "DigitalJazzAsset" struct


struct DigitalJazzAsset: Identifiable{
    var id: UUID =  UUID() // TODO Remove this later after SwiftData library creates them

    var engineSoundID: Int
    var name: String
    var image: ImageResource
    var sound: URL
}

// image filename must match the exact name in Assets.xcassets in camelCase
let defaultDigitalJazzAsset = DigitalJazzAsset(
    engineSoundID: VehicleModel.POD_RACER.rawValue,
    name: "Star Wars Pod Racer",
    image: .starWarsPodRacer,                                                      // Asset catalog symbol
    sound: Bundle.main.url(forResource: "podRacerSound", withExtension: "wav")!
)
