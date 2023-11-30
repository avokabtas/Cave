//
//  CaveView.swift
//  Cave
//
//  Created by Aliia Satbakova on 24.11.2023.
//

import SwiftUI

struct CaveArea: View {
    var caveMap: [[Bool]]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Эти циклы проходят по каждой клетке пещеры в caveMap и отображают прямоугольники для каждой клетки
                ForEach(0..<caveMap.count, id: \.self) { rowIndex in
                    ForEach(0..<caveMap[rowIndex].count, id: \.self) { columnIndex in
                        Rectangle()
                        // Если клетка живая(true), она заполняется цветом indigo, если пустая(false) - white
                            .fill(caveMap[rowIndex][columnIndex] ? Color.indigo : Color.white)
                        // Для установки размеров и позиций каждого прямоугольника в пределах геометрии представления
                            .frame(
                                width: geometry.size.width / CGFloat(caveMap[0].count),
                                height: geometry.size.height / CGFloat(caveMap.count)
                            )
                            .offset(
                                x: CGFloat(columnIndex) * (geometry.size.width / CGFloat(caveMap[0].count)),
                                y: CGFloat(rowIndex) * (geometry.size.height / CGFloat(caveMap.count))
                            )
                    }
                }
            }
        }
        .frame(width: 300, height: 300)
    }
}
