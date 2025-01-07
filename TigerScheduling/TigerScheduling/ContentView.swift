//
//  ContentView.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/6/24.

//  Copyright © 2025 Joseph Laudati. All rights reserved.


// '$' before a variable tells SwiftUI that a variable can be read or written into.
// @State makes variables modifyable by the UI.
//ForEach is like a for loop.

//FUNCTIONAL REQUIREMENT: App must be able to notify user when an event is coming up via a notificaiton.


import SwiftUI
import UserNotifications

struct ContentView: View {
    
    let calendar = Calendar.current
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentDay = Calendar.current.component(.day, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    let currentHour = Calendar.current.component(.hour, from: Date())
    
    @FocusState var signalFlag: Bool //will be used to reset the values once an object is passed to the list
    @FocusState private var amountIsFocused: Bool
    @State private var listOfDates: [DateModel]
    @State private var userDay: Int
    @State private var userMonth: Int
    @State private var userYear: Int
    @State private var userHour: Int
    @State private var userData: String
    @State private var userTime: String
    @State private var times: [String] = ["AM", "PM"]
    @State private var reminderTime: Int
    
    //initalize values to current month, day and year so that your app launches with the correct date.
    init() {
        _listOfDates = State(initialValue: [])
        _userDay = State(initialValue: currentDay)
        _userMonth = State(initialValue: currentMonth)
        _userYear = State(initialValue: currentYear)
        _userHour = State(initialValue: currentHour > 12 ? currentHour - 12 : (currentHour == 0 ? 12 : currentHour))
        _userData = State(initialValue: "")
        _reminderTime = State(initialValue: 1)
        _userTime = State(initialValue: currentHour >= 12 ? "PM" : "AM")
    }

    
    
    
    
    var body: some View {
        ZStack{
            //backg
            NavigationStack {
                ZStack{
                    Color(UIColor.purple)
                        .frame(width: 1000, height: 100)
                    Image("Tiger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                
                
                ZStack{
                    
                    
                    Color(UIColor.orange)
                    
                    
                    Form {
                        
                        /**
                         Section displays information related to our created date.
                         */
                        Section("Your Current Things to do") {
                            if(listOfDates.isEmpty){
                                Text("No dates added.")
                            }
                            else {
                                ForEach(listOfDates) { date in
                                    VStack(alignment: .leading) {
                                        Text(String(format: "%d/%d/%d at: %d:00 %@", date.Month, date.Day, date.Year, date.Hour, date.Time))
                                            .font(.headline)
                                        
                                        Text(date.UIdata)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        /**
                         Section controls the day picker
                         */
                        Section("Day"){
                            Picker("Enter day:", selection: $userDay){
                                ForEach(1...31, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.wheel) // Set the picker style to wheel
                            .frame(height: 80)  // Constrain the height of the picker
                        }
                        
                        /**
                         Section controls month picker
                         */
                        Section("Month"){
                            Picker("Enter month: ", selection: $userMonth){
                                ForEach(1...12, id: \.self){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 80)
                        }
                        
                        /**
                         Section controls year text field.
                         Precondition: User is limited to picking dates with in 10 years of the current year. They cannot pick
                         prior years.
                         */
                        Section("Year"){
                            TextField("Enter Year: ", value: $userYear, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                                .focused($amountIsFocused)
                            
                            if(userYear > currentYear + 10 || userYear < currentYear){
                                Text("Invalid Year! Year entered must be within ten years of current year.")
                                Button("Reset Year"){
                                    userYear = currentYear
                                }
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                            }
                            else{
                                Text("Valid Year")
                                
                            }
                        }
                        
                        
                        /**
                         Section controls the memo logic.
                         Precondtion: User must use strings AND can enter up to 30 characters.
                         */
                        Section("Add memo") {
                            TextField("Enter a short memo. Character Limit: 60", text: $userData)
                                .focused($amountIsFocused)
                                .onChange(of: userData, initial: true) { oldValue, newValue in
                                    if newValue.count > 60 {
                                        userData = String(newValue.prefix(30))
                                    }
                                }
                        }
                        
                        Section("What time would you like to be reminded at?"){
                            HStack(alignment: .center){
                                Picker("Select Hour",selection: $userHour){
                                    ForEach(1...12, id: \.self) { hour in
                                        Text("\(hour):00").tag(hour) // Add tags to ensure proper selection handling
                                    }
                                }
                                
                                .pickerStyle(.wheel)
                                .frame(width: 200, height: 70)
                                
                                Picker("What time of Day", selection: $userTime){
                                    ForEach(times, id: \.self){
                                        time in Text(time)
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(width: 100, height: 70)
                            }
                        }
                        
                        /*
                         reminder Time is defunt at the moment. Implementation will be needed to properly assign it a trigger.
                         
                         */
                        Section("When do you want to be reminded?"){
                        
                                Picker("Select when to be reminded", selection: $reminderTime) {
                                    ForEach(0...7, id: \.self) { reminder in
                                        Text("\(reminder) day\(reminder == 1 ? "" : "s") before")
                                    }
                                }
                                .pickerStyle(.wheel)
                                .frame(height: 70)
                            
                            }
                            
            
                        
                        
                        
                        //BUTTON STUFF
                        //.foregroundColor(.white) changes the color of the text
                        //.padding() Adds spacing around the text
                        //.background(Color.blue) Sets the button's background color
                        //.cornerRadius(10) Adds rounded corners
                        
                        
                        
                        
                        /**
                         Allows the user to add dates to their list
                         */
                        Button("Add Date") {
                            
            
                            
                            
                            
                            // Initialize the DateModel with default or placeholder values
                            let newItem = DateModel(Month: userMonth, Day: userDay, Year: userYear, UIdata: userData, Hour: 0, Time: "")

                                // Use setters to configure the date and time
                                newItem.setDate(day: userDay, month: userMonth, year: userYear)
                                newItem.setHour(hour: userHour) // Converts 24-hour format to 12-hour format
                                newItem.setTime(t: userTime)    // Sets "AM" or "PM"
                            
                            
                            
                            
                            
                            listOfDates.append(newItem)
                            
                            notifications(for: [newItem], daysInAdvance: reminderTime)

                            userHour = 1
                            userMonth = currentMonth
                            userDay = currentDay
                            userYear = currentYear
                            userData = ""
                            userTime = "AM"
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity) // Makes the button expand horizontally
                        .multilineTextAlignment(.center) // aligns the text
                        .disabled(userYear < currentYear || userYear > currentYear + 10 || userHour < 1)
                        
                        Button("Remove Date"){
                            if(!listOfDates.isEmpty){
                                listOfDates.removeLast()
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    }
                    .navigationTitle("Tiger Scheduling")
                    .scrollContentBackground(.hidden)
                    .toolbar{
                        if amountIsFocused{
                            Button("Done"){
                                amountIsFocused = false
                            }
                        }
                    }
                }
                Color(UIColor.purple)
                    .frame(height: 50)
            }
        }
    }
    
    func notifications(for dateModels: [DateModel], daysInAdvance: Int) {
        let hub = UNUserNotificationCenter.current()
        
        for dateInstance in dateModels {  // Loop through all DateModel instances
            let addRequest = {
                let content = UNMutableNotificationContent()
                content.title = "Reminder for: \(dateInstance.Month)/\(dateInstance.Day)/\(dateInstance.Year)"
                content.subtitle = "To Do: \(dateInstance.UIdata)"
                content.sound = UNNotificationSound.default

                // Convert hour to 24-hour format based on AM/PM
                
                let hour24 = dateInstance.convertedTime()
                
                // Calculate the adjusted reminder date
                let calendar = Calendar.current
                let originalDate = calendar.date(from: DateComponents(
                    year: dateInstance.Year,
                    month: dateInstance.Month,
                    day: dateInstance.Day,
                    hour: hour24
                ))!
                let adjustedDate = calendar.date(byAdding: .day, value: -daysInAdvance, to: originalDate)!
                
                // Extract the adjusted date components
                let adjustedDateComponents = calendar.dateComponents([.year, .month, .day, .hour], from: adjustedDate)
                
                // Generate a unique identifier for the notification
                            let notificationID = "\(dateInstance.Month)-\(dateInstance.Day)-\(dateInstance.Year)-\(dateInstance.Hour)"
                            
                            // Store the notificationID in the DateModel
                            dateInstance.notificationID = notificationID
                            
                            // Create a trigger based on the adjusted date components
                            let trigger = UNCalendarNotificationTrigger(dateMatching: adjustedDateComponents, repeats: false)

                            // Create and add the notification request
                            let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
                            hub.add(request) { error in
                                if let error = error {
                                    print("Error scheduling notification: \(error.localizedDescription)")
                                } else {
                                    print("Notification successfully scheduled with ID: \(notificationID)")
                                }
                            }
                        }
                        
                        // Check notification permissions
                        hub.getNotificationSettings { settings in
                            if settings.authorizationStatus == .authorized {
                                addRequest()
                            } else {
                                hub.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                    if success {
                                        addRequest()
                                    } else if let error = error {
                                        print("Authorization error: \(error.localizedDescription)")
                                    }
                                }
                            }
                        }
                    }
                }


    }
    #Preview {
        ContentView()
    }
    
    
    
    
