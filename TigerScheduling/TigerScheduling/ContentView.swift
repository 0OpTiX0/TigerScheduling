//
//  ContentView.swift
//  TigerScheduling
//
//  Created by Joseph Laudati on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color.purple
                .ignoresSafeArea()
            Color(Color.orange)
                .safeAreaPadding()
            
            VStack {
                
                Spacer()
                
                Text("Hello user! How can I assist you today?")
                    .offset(x: 0, y:-70)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Image("busyTiger")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .safeAreaPadding()
                    .offset(x:0, y:-100)
                    .padding()
                
                    //Buttons need logic
                HStack{
                    Button("Schedule") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .font(.title)
                    .offset(x:-20 ,y:-100)
                    
                    Image(systemName: "book")
                        .foregroundColor(Color.blue)
                        .font(.title)
                        .offset(x:-20 ,y:-100)
                    
                    
                    Button("Remove"){
                        
                    }
                    .font(.title)
                    .offset(x:10 ,y:-100)
                    
                    Image(systemName: "eraser.line.dashed")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .offset(x:10 ,y:-100)
                    
                }
                //Buttons need logic
                HStack{
                    Button("Edit"){
                        
                    }
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .offset(x:12,y:-60)
                    
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .offset(x:12 ,y:-63)
                    
                    Button("Settings"){
                        
                    }
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .offset(x:42 ,y:-63)
                    
                    Image(systemName: "wrench")
                        .font(.title)
                        .foregroundColor(Color.blue)
                        .offset(x:42 ,y:-63)
                    
                    
                }
                
                
                Spacer()
            }
            
            
            
            
            
            
            
        }
        
    }
}
            
    #Preview {
    ContentView()
}
