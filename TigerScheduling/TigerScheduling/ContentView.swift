//
//  ContentView.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/6/24.


// '$' before a variable tells SwiftUI that a variable can be read or written into.
// @State makes variables modifyable by the UI.
//ForEach is like a for loop.


import SwiftUI

struct ContentView: View {
    let currentDate = Date()
    let calendar = Calendar.current
    
    
    @State private var userDay: Int = 1
    @State private var userMonth: Int = 1
    @State private var userYear: Int = 2024
    @State private var userData = ""
    
    var body: some View {
        ZStack{
            
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
                            Text("PLACEHOLDER")
                        }
                        
                        
                        Section(""){
                            Picker("Pick a day", selection: $userDay){
                                ForEach(1..<30){
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(.navigationLink)
                        }
                        
                        Button("Add A Date \(userData)") {
                            userData = "Tapped!"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                userData = ""
                            }
                        }
                        
                        Text(userData)
                    }
                    .navigationTitle("Tiger Scheduling")
                    .scrollContentBackground(.hidden)
                }
                
        
                    
               
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}


