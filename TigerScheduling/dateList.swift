//
//  dateList.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/15/24.
//

import Foundation
import UIKit
import SwiftUI

class dateList: ObservableObject {
    @Published var List: [DateModel]

    /**
     Constructor for Date List. It will create an object(s) that store lists of date objects.
     */
    init(List: [DateModel]) {
        self.List = List
    }

    /**
     Creates new date objects based on UI handled by the appController. It will store the month, year, day, and any user input regarded with it.
     - Parameter month: The user-defined month.
     - Parameter year: The user-defined year.
     - Parameter day: The user-defined day.
     - Parameter uI: Any user input that will be displayed as a memo by UI.
     - Returns: A valid `date` object, or `nil` if the date is invalid.
     */
    func createDate(month: Int, day: Int, year: Int, uI: String) -> DateModel? {
        let newDate = DateModel(Month: month, Day: day, Year: year, UIdata: uI)

        if !newDate.checkValidDate(entry: newDate) {
            print("Warning: Invalid date created - \(month)/\(day)/\(year)\n")
            return nil
        }

        return newDate
    }

    /**
     Adds a new date object to the list of objects.
     - Parameter entry: The newly created date.
     */
    func addDateToList(entry: DateModel) {
        List.append(entry)
    }

    /**
     Removes a date object from the list of date objects.
     - Parameter index: An integer representing the location of the selected item.
     */
    func removeDateFromList(index: Int) {
        guard index >= 0 && index < List.count else {
            print("Error: Index out of bounds.\n")
            return
        }

        List.remove(at: index)
    }

    /**
     Changes any information that the user needs to be changed with a date object they've created.
     - Parameter index: The index where the desired date is to be changed.
     - Parameter month: The user's changed month.
     - Parameter year: The user's changed year.
     - Parameter day: The user's changed day.
     - Parameter uI: The edited user input that will be displayed as a memo by UI.
     - Returns: The updated `date` object.
     */
    func editDate(index: Int, month: Int, day: Int, year: Int, uI: String) -> DateModel? {
        guard index >= 0 && index < List.count else {
            print("Error: Index out of bounds.\n")
            return nil
        }

        let currentDate = List[index]
        currentDate.setDate(day: day, month: month, year: year)
        currentDate.editMemo(message: uI)
        return currentDate
    }

    /**
     Helper function that uses the private information inside of a date object and uses the provided information to search for the specific index inside of the current list.
     If the date is found, return its index. If not, return `-1`.
     - Parameter targetDate: The date that is being searched for.
     - Returns: The index of the date in the list, or `-1` if not found.
     */
    func findDateIndex(targetDate: DateModel) -> Int {
        return List.firstIndex(where: { $0.getDate() == targetDate.getDate() }) ?? -1
    }

    /**
     Retrieves all date objects in the list formatted as strings for UI purposes.
     - Returns: An array of strings containing the date and memo information for each entry.
     */
    func viewAllDates() -> [String] {
        return List.map { "\($0.getDate()) - \($0.viewMemo())" }
    }
}


