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
            MainView()
        }
    }
}

struct MainView: View {
    // TODO: Replace with your real UserAsset and vehicles
    let user = UserAsset(firstName: "Blaze", phoneNumber: 7196390839, vehicles: ["5YJ3E1EB2JF100019", "12345678901234567"])
    let vehicleNames = ["Tesla Model 3", "Kit (2006)"]
    
    private var listStyleForPlatform: some ListStyle {
        #if os(iOS)
        return InsetGroupedListStyle()
        #else
        return InsetListStyle()
        #endif
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                // User Profile Section
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.gray, Color.gray.opacity(0.25))
                    VStack(alignment: .leading) {
                        Text(user.firstName)
                            .font(.title2.bold())
                        Text("Phone: \(user.phoneNumber)")
                            .font(.footnote)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                // Vehicle List Section
                List(vehicleNames, id: \.self) { name in
                    HStack {
                        Image(systemName: "car.fill")
                            .resizable()
                            .frame(width: 32, height: 20)
                            .foregroundColor(.accentColor)
                        Text(name)
                            .font(.headline)
                    }
                }
                .listStyle(listStyleForPlatform)
                
                Spacer()
            }
            .navigationTitle("DMuffler Garage")
            .toolbar {
                ToolbarItem(placement: .primaryAction) { // Changed from .navigationBarTrailing
                    Button(action: { /* TODO: Implement settings */ }) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}


struct ContentView: View {
    var body: some View {
        //TODO UserDefaults
        
        let TestStruct = Vehicle(vin: "12345678901234567", make: VehicleMake.TESLA, model: VehicleModel.MODEL_3, year: 2006, name: "Kit")
        Text(TestStruct.description)
            .font(.system(.body, design: .monospaced))
            .padding()
        
        let UserStruct = UserAsset(firstName: "Blaze", phoneNumber: 7196390839, vehicles: ["5YJ3E1EB2JF100019"])
        
        Text(UserStruct.description)
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
