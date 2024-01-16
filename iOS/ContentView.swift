//
//  ContentView.swift
//  iOS
//
//  Created by dasoya on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tapCount = 0
    @State var name = ""
    
    var names = ["다소","다솜","길동"]
    @State var selectedName = "다소"
    var cake : Int = 0
    
    var body: some View {
     
       NavigationStack{
            
           
            Form{
                Section{
                    Button("Tap Count: \(tapCount)"){
                        tapCount += 1
                    }
                }
                
                Section{
                    TextField("Enter your name",text: $name)
                    Text("your name is \(name)")
                }
                
                Section{
                    
//                    ForEach(0..<6){ number in
//                        Text("\(number)")
//                    }
                    
                    Picker("Select your name", selection: $selectedName){
                        ForEach(names, id: \.self){
                            Text("\($0)")
                        }
                    }
                    
            
                }
            }.navigationTitle("iOS")
       }
    }
}

#Preview {
    ContentView()
}
