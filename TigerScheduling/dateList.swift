//
//  dateList.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/15/24.
//  Copyright © 2024 Joseph Laudati. All rights reserved.

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


  

    }


