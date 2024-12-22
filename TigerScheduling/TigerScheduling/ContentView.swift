//
//  ContentView.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/6/24.

//  Copyright © 2024 Joseph Laudati. All rights reserved.


// '$' before a variable tells SwiftUI that a variable can be read or written into.
// @State makes variables modifyable by the UI.
//ForEach is like a for loop.

//FUNCTIONAL REQUIREMENT: App must be able to notify user when an event is coming up via a notificaiton.


import SwiftUI

struct ContentView: View {
    let currentDate = Date()
    let calendar = Calendar.current
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentDay = Calendar.current.component(.month, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    @FocusState var signalFlag: Bool //will be used to reset the values once an object is passed to the list
    @FocusState private var amountIsFocused: Bool

    
    @State private var listOfDates: [DateModel] = []
    @State private var userDay: Int = 1
    @State private var userMonth: Int = 1
    @State private var userYear: Int = 2024
    @State private var userData = ""
    
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
                                        Text(String(format: "%d/%d/%d", date.Month, date.Day, date.Year))
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
                            TextField("Enter a short memo", text: $userData)
                                .focused($amountIsFocused)
                                .onChange(of: userData, initial: true) { oldValue, newValue in
                                    if newValue.count > 30 {
                                        userData = String(newValue.prefix(30))
                                    }
                                }
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
                            let newItem = DateModel(Month: userMonth, Day: userDay, Year: userYear, UIdata: userData)
                            listOfDates.append(newItem)
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity) // Makes the button expand horizontally
                        .multilineTextAlignment(.center) // aligns the text
                        
                        
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
}

#Preview {
    ContentView()
}


