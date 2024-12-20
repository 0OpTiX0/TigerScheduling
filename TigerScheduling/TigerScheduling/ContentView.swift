//
//  ContentView.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/6/24.


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

    
    @State private var listOfDates: [DateModel] = [
        DateModel(Month: 01, Day: 03, Year: 2025, UIdata: "Go and buy gifts for mom")
    ]
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
                       
                        Section("Your Current Things to do") {
                            if(listOfDates.isEmpty){
                                Text("No dates added.")
                            }
                            else {
                                ForEach(listOfDates) { date in
                                    VStack(alignment: .leading) {
                                        Text(String(format: "%d/%d/%d", date.Day, date.Month, date.Year))
                                            .font(.headline)
                                        Text(date.UIdata)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        
                        Section("Day"){
                            Picker("Enter day:", selection: $userDay){
                                ForEach(1..<32){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.wheel) // Set the picker style to wheel
                            .frame(height: 80)  // Constrain the height of the picker
                        }
                        
                        Section("Month"){
                            Picker("Enter month: ", selection: $userMonth){
                                ForEach(1..<13){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 80)
                        }
                        
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
                        // More test functions. Will not be incorporated in final design.
                        Button("Add Date") {
                          
                        }
                        .font(.headline)
                        .frame(maxWidth: .infinity) // Makes the button expand horizontally
                        .multilineTextAlignment(.center) // aligns the text
                        
                        
                        
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


