//
//  dateList.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/15/24.
//

import Foundation
//import UIKit

class dateList{
    var List: [date]
    
    /**
     Constructor for Date List. It will create an object(s) that store lists of date objects.
     */
    init(List:[date]){
        self.List = []
    }
    
    
    /**
     Creates new date obects based on UI handled by the appController. It will store the month, year, day, and any user input regarded with it
     - Parameter month: The user defined month
     - Parameter year: The user defined year
     - Parameter day: The user defined day
     - Parameter uI: Any user input that will be displayed as a memo by UI
     - Return : date
     */
    func createDate(month:Int, day:Int, year:Int, uI:String) -> date{
        
        //this is how you create a new object in swift! You initalize a new date by calling the constructor!
        let newDate: date = date.init(Month: month, Day:day, Year:year, UIdata: uI)
        
        return newDate
    }
    
    /**
     Adds a new date object to the list of objects
     - Parameter entry: The newly created date.
     */
    func addDateToList(entry:date){
        List.append(entry)
    }
    
    /**
     Removes a date object from the list of date objects
     */
    func removeDateFromList(item: date){
        
    }
    
    /**
     Changes any information that the user needs to be changed with a date objevt theyve created.
     - Parameter Item: the date to be edited
     - Parameter month: The user's changed month
     - Parameter year: The user's changed year
     - Parameter day: The user's changed day
     - Parameter uI: The edited user input that will be displayed as a memo by UI
     - Return : date

     */
    func editDate(Item: date, month:Int, day: Int, year: Int, uI: String) -> date{
        
        
        
        return Item
    }
    
    //View List function? Handled and rendered by the UI...
    
    //Need something to allow UI to see information from list. Needs details of each class. day, month, year, and UI.
   
    //Need logic for reminder. Figure out how to use notifications to set reminders (thats what the app is for. duh!)
    
    //Need logic for settings (idk what settings i need to add but hey, it works.)
    //Settings to consider: Notification prefs (BOOL), Time zone stuff, UserDefaults???
    
    
    
    
    
    //FUTURE STUFF:
    //Might add compatibility with watch! or even macOS(maybe)!
    //Def work on setting times to allow reminders by the hour.
    //Update the UI so it looks pretty.
    //Thats about it... Who knows what might be next V(;D)V
    
    
    //end of class (For coding purposes)
}


