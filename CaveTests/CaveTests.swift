//
//  CaveTests.swift
//  CaveTests
//
//  Created by Aliia Satbakova on 23.11.2023.
//

import XCTest
@testable import Cave

final class CaveTests: XCTestCase {
    
    func testSize() {
        // given
        let cave = Cave()
        // when
        cave.setWidth(15)
        cave.setHeight(15)
        // then
        XCTAssertEqual(cave.getColumns(), 15)
        XCTAssertEqual(cave.getRows(), 15)
    }
    
    func testInitCave() {
        // given
        let cave = Cave()
        cave.setWidth(10)
        cave.setHeight(10)
        
        // when
        cave.setChance(50)
        cave.initCave()
        var caveMap = cave.getCaveMap()
        var points = 0
        for i in 0..<cave.getRows() {
            for j in 0..<cave.getColumns() {
                if caveMap[i][j] {
                    points += 1
                }
            }
        }
        // then
        XCTAssertTrue(points > 40 && points < 60)
        
        // when
        cave.setChance(75)
        cave.initCave()
        caveMap = cave.getCaveMap()
        points = 0
        for i in 0..<cave.getRows() {
            for j in 0..<cave.getColumns() {
                if caveMap[i][j] {
                    points += 1
                }
            }
        }
        // then
        XCTAssertTrue(points > 65 && points < 85)
        
        // when
        cave.setChance(25)
        cave.initCave()
        caveMap = cave.getCaveMap()
        points = 0
        for i in 0..<cave.getRows() {
            for j in 0..<cave.getColumns() {
                if caveMap[i][j] {
                    points += 1
                }
            }
        }
        // then
        XCTAssertTrue(points > 15 && points < 35)
    }
    
}
