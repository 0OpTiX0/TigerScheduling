//
//  dateClass.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/15/24.
//

import Foundation


//Observable objects are objects that notify SwiftUI or other observers that data has changed. They are teh subjects!
class DateModel: ObservableObject, Identifiable{
    let id = UUID()
    @Published var Month: Int
    @Published var Day: Int
    @Published var Year: Int
    @Published var UIdata: String
    
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
     - Parameter message: string
     - Returns: none
     */
    func editMemo(message:String){
        UIdata = message
    }
    
    
    
    
    
    /**
    Relays the objects UIdata
     - Returns: Attached date message
     
     */
    func viewMemo()->String{
        return UIdata
    }
    
    
    
    
    
    /**
        Relays  private data stored in  Month, Day, and Year
     
   - Returns: Month, Day, and Year stored inside of the object.
     */
    func getDate() -> String {
           return "\(Month)/\(Day)/\(Year)"
       }
    
    
    
    
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
}
