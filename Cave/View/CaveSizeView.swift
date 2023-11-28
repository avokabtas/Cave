//
//  CaveSizeView.swift
//  Cave
//
//  Created by Aliia Satbakova  on 28.11.2023.
//

import SwiftUI

struct CaveSizeView: View {
    
    // MARK: - Public Properties
    
    @State var rows: Int
    @State var columns: Int
    
    // MARK: - Visual Components
    
    var body: some View {
        VStack {
            Text("Set the size")
                .fontWeight(.bold)
                .font(.system(.title3, design: .rounded))
            
            Stepper(value: $rows, in: 1...50) {
                Text("Rows: \(rows)")
            }
            .accessibilityIdentifier("RowsStepper") // For UITests
            
            Stepper(value: $columns, in: 1...50) {
                Text("Columns: \(columns)")
            }
            .accessibilityIdentifier("ColumnsStepper") // For UITests
        }
        .padding()
    }
}
