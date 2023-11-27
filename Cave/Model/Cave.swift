//
//  CaveModel.swift
//  Cave
//
//  Created by Aliia Satbakova on 23.11.2023.
//

import Foundation

final class Cave {
    
    // MARK: - Private Properties
    
    // Ширина и высота пещеры
    private var width: Int = 0
    private var height: Int = 0
    // Шанс начальной инициализации
    private var chance: Int = 0
    // Лимиты рождения и смерти клеток
    private var birthLimit: Int = 0
    private var deathLimit: Int = 0
    // Двумерный массив Bool, представляющий пещеру (true - клетка заполнена, false - пустая клетка)
    private var caveMap: [[Bool]] = []
    
    // MARK: - Init
    
    func initCave() {
        caveMap = Array(repeating: Array(repeating: false, count: width), count: height)
        fillCaveMap()
    }
    
    // MARK: - Public Methods
    
    // Устанавливает соответствующие параметры пещеры
    func setWidth(_ width: Int) {
        self.width = width
    }
    
    func setHeight(_ height: Int) {
        self.height = height
    }
    
    func setBirthLimit(_ birthLimit: Int) {
        self.birthLimit = birthLimit
    }
    
    func setDeathLimit(_ deathLimit: Int) {
        self.deathLimit = deathLimit
    }
    
    func setChance(_ chance: Int) {
        self.chance = chance
    }
    
    // Возвращает количество строк и столбцов пещеры
    func getRows() -> Int {
        return height
    }
    
    func getColumns() -> Int {
        return width
    }
    
    // Возращает карту пещеры
    func getCaveMap() -> [[Bool]] {
        return caveMap
    }
    
    // Отрисовка текущего состояния карты пещеры
    func printMap() {
        printCaveMap(caveMap)
    }
    
    // Запускает итерацию эволюции пещеры
    func stepRun() {
        let prevMap = copyCaveMap()
        cellularAutomation(prevMap)
    }
    
    // MARK: - Private Methods
    
    // Заполняет caveMap случайными значениями в соответствии с chance
    private func fillCaveMap() {
        srand48(Int(time(nil)))
        for row in 0..<height {
            for column in 0..<width {
                caveMap[row][column] = (Int.random(in: 0..<100) < chance)
            }
        }
    }
    
    // Реализует правила эволюции клеток пещеры на основе предыдущего состояния
    private func cellularAutomation(_ prevMap: [[Bool]]) {
        for row in 0..<height {
            for column in 0..<width {
                // Для отслеживания количества живых соседей
                var neighborhoodAliveCount = 0
                // Проверяет соседние клетки вокруг текущей клетки
                for neighborRow in (row - 1)...(row + 1) {
                    for neighborColumn in (column - 1)...(column + 1) {
                        // Проверяется каждая из соседних клеток: если клетка находится в границах пещеры 
                        // и не является самой клеткой (текущей), то проверяется, является ли она живой - true
                        if !(neighborRow < 0 || neighborColumn < 0 || neighborRow == height || neighborColumn == width)
                            && !(neighborRow == row && neighborColumn == column) {
                            // Если да, то увеличивается счетчик соседних клеток neighborhoodAliveCount
                            if prevMap[neighborRow][neighborColumn] {
                                neighborhoodAliveCount += 1
                            }
                        }
                    }
                }
                // Если текущая клетка жива - true и количество соседей меньше или равно deathLimit,
                // то она становится мертвой
                if prevMap[row][column] && neighborhoodAliveCount <= deathLimit {
                    caveMap[row][column] = false
                }
                // Если текущая клетка мертва - false и количество соседей больше birthLimit,
                // то она становится живой
                if !prevMap[row][column] && neighborhoodAliveCount > birthLimit {
                    caveMap[row][column] = true
                }
            }
        }
    }
    
    // Создает копию текущего состояния пещеры
    private func copyCaveMap() -> [[Bool]] {
        var copyMap = Array(repeating: Array(repeating: false, count: width), count: height)
        for row in 0..<height {
            for column in 0..<width {
                copyMap[row][column] = caveMap[row][column]
            }
        }
        return copyMap
    }
    
    // Печатает карту пещеры в консоль
    private func printCaveMap(_ map: [[Bool]]) {
        for row in map {
            var rowString = ""
            for cell in row {
                rowString += (cell ? "██" : "  ")
            }
            print(rowString)
        }
    }
}
