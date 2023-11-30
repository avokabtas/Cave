//
//  ContentView.swift
//  Cave
//
//  Created by Aliia Satbakova on 23.11.2023.
//

import SwiftUI

struct CaveView: View {
    
    // MARK: - Private Properties
    
    @State private var cave = Cave()
    @State private var caveMap: [[Bool]] = []
    @State private var timer: Timer?
    @State private var isTimerRunning = false // Состояние для отслеживания статуса таймера
    
    // MARK: - Initial Settings
    
    @State private var rows = 20
    @State private var columns = 20
    @State private var birthLimit = 3
    @State private var deathLimit = 4
    @State private var chance = 45  // %
    @State private var autoStepTime = 500  // Milliseconds
    
    // MARK: - Visual Components
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Spacer()
                
                // MARK: - Map Area
                
                CaveArea(caveMap: caveMap)
                
                Spacer(minLength: 1)
                
                // MARK: - Size Settings
                
                CaveSize(rows: $rows, columns: $columns)
                
                Spacer(minLength: 0)
                
                // MARK: - Limits Settings
                
                CaveLimits(birthLimit: $birthLimit, deathLimit: $deathLimit, chance: $chance)
                
                Spacer(minLength: 10)
                
                // MARK: - Buttons Section
                
                HStack {
                    ClearButton {
                        stopTimer()  // Останавливаем работу таймера
                        caveMap = [] // Очистка массива пещеры
                    }
                    GenerateButton {
                        stopTimer()
                        cave.setWidth(columns)
                        cave.setHeight(rows)
                        cave.setBirthLimit(birthLimit)
                        cave.setDeathLimit(deathLimit)
                        cave.setChance(chance)
                        cave.initCave()
                        drawCave()
                    }
                    ManualStepButton {
                        stopTimer()
                        stepCave()
                    }
                }
                
                Spacer(minLength: 10)
                
                HStack {
                    AutoStepTimeStepper(autoStepTime: $autoStepTime)
                    AutoStepButton {
                        if !isTimerRunning { // Проверяем, не запущен ли уже таймер
                            timer = Timer.scheduledTimer(withTimeInterval: Double(autoStepTime) / 1000, repeats: true) { _ in
                                stepCave()
                            }
                            isTimerRunning = true // Устанавливаем флаг, что таймер запущен
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
    }
    
}

// MARK: - Draw, Step, Timer

extension CaveView {
    func drawCave() {
        // Здесь нужно обновить визуализацию пещеры на экране
        // Используя данные из объекта Cave
        caveMap = cave.getCaveMap()
    }
    
    func stepCave() {
        cave.stepRun() // Работа алгоритма
        drawCave() // Рисуем пещеру
    }
    
    func stopTimer() {
        timer?.invalidate() // Остановка таймера
        timer = nil // Обнуление таймера
        isTimerRunning = false // Сбрасываем флаг при остановке таймера
    }
}

// MARK: - Preview Canvas

#Preview {
    CaveView()
}
