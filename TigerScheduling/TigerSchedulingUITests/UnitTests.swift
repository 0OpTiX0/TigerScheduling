//
//  TigerSchedulingUITests.swift
//  TigerSchedulingUITests
//
//  Created by Joseph Laudati on 1/6/25.
//

import XCTest
@testable import TigerScheduling

final class TigerSchedulingUITests: XCTestCase {

  
    override func setUpWithError() throws {
            try super.setUpWithError()
            // Setup code before each test
        }
    
    override func tearDownWithError() throws {
            // Cleanup code after each test
            try super.tearDownWithError()
        }
    
    
    func testAdd_Date_01_05_2025_at_0900_PM() {
        var listOfDates: [DateModel] = []
        let exDate = DateModel(Month: 1, Day: 5, Year: 2025, UIdata: "TESTING!", Hour: 9, Time: "PM")
        listOfDates.append(exDate)
        
        XCTAssertEqual(listOfDates.count, 1, "List should contain exactly one item.")
        XCTAssertEqual(listOfDates[0].Month, 1, "Month should be 1.")
        XCTAssertEqual(listOfDates[0].Day, 5, "Day should be 5.")
        XCTAssertEqual(listOfDates[0].Year, 2025, "Year should be 2025.")
        XCTAssertEqual(listOfDates[0].Time, "PM", "Time should be PM.")
        XCTAssertEqual(listOfDates[0].UIdata, "TESTING!", "UIdata should match.")
    }
    
    func testAdd_Date_12_31_2025_at_1200_AM(){
        
        var listOfDates: [DateModel] = []
        let exDate = DateModel(Month: 12, Day: 31, Year: 2025, UIdata: "TESTING!", Hour: 12, Time: "AM")
        listOfDates.append(exDate)
        
        XCTAssertEqual(listOfDates.count, 1, "List should contain exactly one item.")
        XCTAssertEqual(listOfDates[0].Month, 12, "Month should be 12.")
        XCTAssertEqual(listOfDates[0].Day, 31, "Day should be 31.")
        XCTAssertEqual(listOfDates[0].Year, 2025, "Year should be 2025.")
        XCTAssertEqual(listOfDates[0].Time, "AM", "Time should be AM.")
        XCTAssertEqual(listOfDates[0].Hour, 12)
        XCTAssertEqual(listOfDates[0].UIdata, "TESTING!", "UIdata should match.")
        
    }
    
    
    func testAdd_Date_2_25_2025_at_500_PM(){
        var listOfDates: [DateModel] = []
        let exDate = DateModel(Month: 1, Day: 1, Year: 2025, UIdata: "TESTING!", Hour: 1, Time: "AM")
        
        exDate.setDate(day: 25, month: 2, year: 2025)
        exDate.setHour(hour: 5)
        exDate.setTime(t: "PM")
        listOfDates.append(exDate)
        
        XCTAssertEqual(listOfDates.count, 1)
        XCTAssertEqual(listOfDates[0].Month, 2)
        XCTAssertEqual(listOfDates[0].Day, 25)
        XCTAssertEqual(listOfDates[0].Year, 2025)
        XCTAssertEqual(listOfDates[0].Time, "PM")
        XCTAssertEqual(listOfDates[0].Hour, 5)
        XCTAssertEqual(listOfDates[0].UIdata, "TESTING!")
        
        
    }
    
    
    
    

}
