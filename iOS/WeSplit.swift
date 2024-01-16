//
//  WeSplit.swift
//  iOS
//
//  Created by dasoya on 1/16/24.
//

import SwiftUI

struct WeSplit: View {
    
    @State var checkAmount = 0.0
    @State var numberOfPeople = 0
    @State var tipPercentage = 0
    
    var totalAmount : Double {
        let tipValue = checkAmount/100 * Double(tipPercentage)
        
        return checkAmount + tipValue
    }
    
    var totalPerPerson : Double {
        return totalAmount/Double(numberOfPeople+2)
    }
    
    let tipPercentages = [10,15,20,25,0]
    
    
    var body: some View {
        NavigationStack{
            Form{
            
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: "KRW"))
                    
                    Picker("Number of People",selection: $numberOfPeople){
                        ForEach(2..<51){
                            Text("\($0) people")
                        }
                    }
                }
                
                Section{
                    Picker("Tip percentage",selection: $tipPercentage){
                        
                        ForEach(tipPercentages, id: \.self){
                            Text($0,format:.percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(totalAmount,format:.currency(code: "KRW"))
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
                
                Section{
                    Text(totalPerPerson,format:.currency(code: "KRW"))
                }
                
            }.navigationTitle("WeSplit")
        }
    }
}

#Preview {
    WeSplit()
}
