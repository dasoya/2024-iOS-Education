//
//  WeSplit.swift
//  ios
//
//  Created by dasoya on 7/1/24.
//

import SwiftUI

struct WeSplit: View {
    
    
    @State var checkAmount = 0.0
    @State var numberOfPeople = 0
    
    
    var body: some View {
       
        NavigationStack{
            
            Form{
                
                Section{
                    
                    TextField("Amount", value: $checkAmount, format:.currency(code: "KRW"))
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        
                        ForEach(2..<51){
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.inline)
                    
                }
                
            }.navigationTitle("WeSplit")

            
        }
        
    }
}

#Preview {
    WeSplit()
}
