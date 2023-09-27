//
//  CalculationTests.swift
//  UnitTestingSwiftUITests
//
//  Created by Yunus Emre Taşdemir on 27.09.2023.
//

import XCTest
@testable import UnitTestingSwiftUI

final class CalculationTests: XCTestCase {
    
    func testSuccessfulTipCalculation() {
        // Given (Arrange)
        let enteredAmount = 100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertEqual(tip, 25)
    }
    
    func testNegativeEnteredAmountTipCalculation() {
        // Given (Arrange)
        let enteredAmount = -100.00
        let tipSlider = 25.0
        let calculation = Calculation()
        
        
        // When (Act)
        let tip = calculation.calculateTip(of: enteredAmount, with: tipSlider)
        
        // Then (Assert)
        XCTAssertNil(tip)
    }

}
