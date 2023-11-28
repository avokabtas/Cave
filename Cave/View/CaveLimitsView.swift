//
//  CaveLimitsView.swift
//  Cave
//
//  Created by Aliia Satbakova  on 28.11.2023.
//

import SwiftUI

struct CaveLimitsView: View {
    
    // MARK: - Public Properties
    
    @State var birthLimit: Int
    @State var deathLimit: Int
    @State var chance: Int
    
    // MARK: - Visual Components
    
    var body: some View {
        VStack {
            Text("Set the limits")
                .fontWeight(.bold)
                .font(.system(.title3, design: .rounded))
            
            Stepper(value: $birthLimit, in: 0...7) {
                Text("Birth Limit: \(birthLimit)")
            }
            .accessibilityIdentifier("BirthLimitStepper") // For UITests
            
            Stepper(value: $deathLimit, in: 0...7) {
                Text("Death Limit: \(deathLimit)")
            }
            .accessibilityIdentifier("DeathLimitStepper") // For UITests
            
            Stepper(value: $chance, in: 0...100) {
                Text("Chance: \(chance)%")
            }
            .accessibilityIdentifier("ChanceStepper") // For UITests
        }
        .padding()
    }
}
