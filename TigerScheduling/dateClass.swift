//
//  dateClass.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/15/24.
//

import Foundation



class date{
    private var Month: Int
    private var Day: Int
    private var Year: Int
    private var UIdata: String
    
    /**
    Constructor initializes Month, Day, Year, and UI Data
     */
    init(Month: Int, Day: Int, Year: Int, UIdata: String) {
        self.Month = Month
        self.Day = Day
        self.Year = Year
        self.UIdata  = UIdata
    }
    
    /**
     This is a setter for the day month and year parameters inside of each date class.
     - Parameter day: The day to be set for each date object
     - Parameter month: The month to be set for each date object
     - Parameter year: The year to be set for each date object
     
     - return: String
     */
    func setDate(day: Int, month:Int, year:Int ){
        self.Day = day
        self.Month = month
        self.Year = year
    }
    
    /**
     Stores user inputted data if they wish to enter a memo about an event they have.
     This will take in data from the UI like the rest of the setters.
     
     - return: none
     */
    func readMemo(message:String){
        UIdata = message
    }
    
    /**
        Returns private data sotred in UIdata
     
     - return: String
     */
    
    func viewMemo()->String{
        return UIdata
    }
    
    /**
        Relays  private data stored in  Month, Day, and Year
     
     - return: String
     */
    func getDate() -> String {
           return "\(Month)/\(Day)/\(Year)"
       }
    
    
    
    
    
}
