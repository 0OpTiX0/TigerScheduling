//
//  dateClass.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/15/24.
//  Copyright © 2025 Joseph Laudati. All rights reserved.

import Foundation


//Observable objects are objects that notify SwiftUI or other observers that data has changed. They are teh subjects!
class DateModel: ObservableObject, Identifiable{
    let id = UUID()
    @Published var Hour: Int
    @Published var Time: String
    @Published var Month: Int
    @Published var Day: Int
    @Published var Year: Int
    @Published var UIdata: String
    var notificationID: String?
    
    /**
     Constructor initializes Month, Day, Year, and UI Data
     */
    init(Month: Int, Day: Int, Year: Int, UIdata: String, Hour: Int, Time: String) {
        self.Hour = Hour
        self.Month = Month
        self.Day = Day
        self.Year = Year
        self.UIdata  = UIdata
        self.Time = Time
    }
    
    
    
    /**
     This is a setter for the day month and year parameters inside of each date class.
     
     - Precondition: day, month, AND year values must be within the respective ranges that the Gregorian calendar follows. Day: 1 thru 31 (depending on month) Year (within 10 years of current year)
     Month: 1 thru 12 (representing January through December
     
     - Parameter day: The day to be set for each date object
     - Parameter month: The month to be set for each date object
     - Parameter year: The year to be set for each date object
     
     - returns: None
     */
    func setDate(day: Int, month:Int, year:Int ){
        self.Day = day
        self.Month = month
        self.Year = year
    }
    
    
    /**
    Sets the object hour to the user's input
     */
    func setHour(hour: Int) {
            self.Hour = hour
    }
    
    /**
     Translates 12hr formatted times to 24hr times via a detector that looks to see if userTime is either "AM" or "PM"
     - Precondition:hour must be within the 12hr format
     - Parameter hour: The hour to be set for each date object
     - returns: converted_24: the converted time.
     */
    func convertedTime()-> Int{
        
        
        if(Time == "PM"){
            return Hour + 12
        }
        else if(Time == "AM" && Hour == 12){
            return 0
        }
        
        return Hour
        
    }



    
    /**
     Setter to set userTime when declaring which time of day it is when declaring hour
     - Parameter t: the string that will contain the user entered time of day
     - returns: none
     */
    
    func setTime(t: String){
        self.Time = t
    }
    

    
    /**
     Relays private data stored in Hour
     - Returns: Hour stored inside of the object
     */
    func getHour() -> String{
        return "\(Hour)"
    }
    
    /**
     Relays private data stored inside of Time
     - Returns: Time stored inside of the object
     */
    func getTime() -> String{
        return "\(Time)"
    }
    
    /**
     Creates new date objects based on UI handled by the appController. It will store the month, year, day, and any user input regarded with it.
     - Parameter month: The user-defined month.
     - Parameter year: The user-defined year.
     - Parameter day: The user-defined day.
     - Parameter uI: Any user input that will be displayed as a memo by UI.
     - Returns: A valid `date` object, or `nil` if the date is invalid.
     */
    static func createDate(month: Int, day: Int, year: Int, uI: String, hour: Int, time: String) -> DateModel? {
        let newDate = DateModel(Month: month, Day: day, Year: year, UIdata: uI, Hour: hour, Time: time)
     /* DEPRECIATED FOR NOW
        if !newDate.checkValidDate(entry: newDate) {
            print("Warning: Invalid date created - \(month)/\(day)/\(year)\n")
            return nil
        }
     */
        return newDate
    }
    
    
    /*
     
     DEPRECIATED FOR NOW
     
     /**
      This function ensures valid dates by checking leap years, maxima and minima dates, correct months, and as well as preventing the creation of past dates.
      - Parameter entry: the date that is to be checked (self)
      - return : Boolean
      */
     func checkValidDate(entry: DateModel)->Bool{
     let today = Date()
     var _: Int = Calendar.current.component(.day, from: today)
     var _: Int = Calendar.current.component(.year, from: today)
     var _: Int = Calendar.current.component(.month, from: today)
     
     //Boundary handling
     if entry.Month > 12 || entry.Month < 1{
     return false
     }
     
     else if entry.Day < 1 || entry.Day > 31 {
     return false
     }
     
     else if (entry.Month == 1 || entry.Month == 3 || entry.Month == 5 || entry.Month == 7 || entry.Month == 8 || entry.Month == 10 || entry.Month == 12) && entry.Day > 31 {
     return false
     }
     
     else if (entry.Month == 4 || entry.Month == 6 || entry.Month == 9 || entry.Month == 11) && entry.Day > 30 {
     return false
     }
     
     
     //leap year handling
     else if entry.Month == 02{
     //if it is not a leap year
     if (entry.Year % 4 != 0 || (entry.Year % 100 == 0 && entry.Year % 400 != 0)) && entry.Day > 28 {
     return false;
     }
     
     //if it is a leap year
     else if ((entry.Year % 4 == 0 && (entry.Year % 100 != 0 || entry.Year % 400 == 0))) && entry.Day > 29{
     return false
     }
     
     }
     
     // current date handling
     let entryDate = Calendar.current.date(from: DateComponents(year: entry.Year, month: entry.Month, day: entry.Day)) ?? today
     
     if entryDate < today {
     return false
     }
     
     
     
     
     return true
     }
     
     
     //end of class for coding purposes
     /*
      */*/
    
    
    
}
