//
//  CaveTimeStepper.swift
//  Cave
//
//  Created by Aliia Satbakova  on 29.11.2023.
//

import SwiftUI

struct AutoStepTimeStepper: View {
    @Binding var autoStepTime: Int
    
    var body: some View {
        Stepper(value: $autoStepTime, in: 100...2000, step: 100) {
            Text("1 step in \(autoStepTime) ms")
        }
        .accessibilityIdentifier("AutoStepTimeStepper") // For UITests
        .padding()
    }
}
