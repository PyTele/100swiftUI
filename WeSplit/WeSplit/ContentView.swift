//
//  ContentView.swift
//  WeSplit
//
//  Created by Hubert Leszkiewicz on 01/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @State private var currency = ["£", "$", "€", "¥", "ZŁ", "฿"]
    @State private var chosenCurrency = 0
    @State private var RemainingTotal = 0
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
        
    var body: some View {
        NavigationView {
        Form {
            Section(header: Text("WeSplit your bills!")) {
                TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach( 2..<100) {
                        Text("\($0)")
                    }
                }
                
                Picker("Currency", selection: $chosenCurrency) {
                    ForEach(0..<currency.count) {
                        Text("\(self.currency[$0])")
                    }
                }
            }
            
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0..<tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Total per person")) {
                Text("\(currency[chosenCurrency])\(totalPerPerson, specifier: "%.2f")")
            }
            Section(header: Text ("Full total")) {
                let tipSelection = Double(tipPercentages[tipPercentage])
                let orderAmount = Double(checkAmount) ?? 0
                
                let tipValue = orderAmount / 100 * tipSelection
                let grandTotal = orderAmount + tipValue
                
                Text("\(currency[chosenCurrency])\(grandTotal, specifier: "%.2f")")
            }
        }
        .navigationBarTitle("WeSplit")
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

