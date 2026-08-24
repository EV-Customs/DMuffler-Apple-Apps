//  ContentView.swift
//  For use with the DMuffler product line of EV Customs LLC
//
//  Created by Blaze Sanders on 2026-08-04
//  For support email dev@evcustoms.store


//TODO import CarPlay
import CarKey

import SwiftUI
import Playgrounds

@main struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        //TODO UserDefaults
        
        let TestObject = Vehicle(vin: "12345678901234567", make: VehicleMake.TESLA, model: VehicleModel.MODEL_3, year: 2006, name: "Kit")
        Text(TestObject.description)
            .font(.system(.body, design: .monospaced))
            .padding()
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
