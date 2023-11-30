//
//  CaveButtons.swift
//  Cave
//
//  Created by Aliia Satbakova  on 29.11.2023.
//

import SwiftUI

struct ClearButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("Clear") {
            action()
        }
        .font(.system(.headline, design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal)
        .tint(.red)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct GenerateButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("Generate") {
            action()
        }
        .font(.system(.headline, design: .rounded))
        .lineLimit(1) // Ограничиваем количество строк текста до одной - iPhone mini
        .minimumScaleFactor(0.5) // Минимальный масштаб текста - iPhone mini
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .tint(.black)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct ManualStepButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("Step") {
            action()
        }
        .font(.system(.headline, design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal)
        .tint(.indigo)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}

struct AutoStepButton: View {
    let action: () -> Void
    
    var body: some View {
        Button("Auto") {
            action()
        }
        .font(.system(.headline, design: .rounded))
        .foregroundColor(.white)
        .tint(.orange)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .padding()
    }
}
