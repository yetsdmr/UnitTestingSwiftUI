//
//  ContentView.swift
//  UnitTestingSwiftUI
//
//  Created by Yunus Emre Taşdemir on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredAmount: String = ""
    @State private var tipAmount: Double = 0
    @State private var totalAmount: Double = 0
    @State private var tipSlider: Double = 15
     
    var body: some View {
        VStack(spacing: 40) {
            VStack {
                Text("Enter Bill Amount")
                    .foregroundColor(.secondary)
                
                TextField("0.00", text: $enteredAmount)
                    .font(.system(size: 70, weight: .semibold, design: .rounded))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
            }
            
            Text("Tip: \(tipSlider, specifier: "%.0f")%")
            
            Slider(value: $tipSlider, in: 0...100, step: 1)
                .onChange(of: tipSlider) {
                    guard let amount = Double (enteredAmount) else {
                        print("Invalid Entry")
                        return
                    }
                    
                    guard let tip = Calculation().calculateTip(of: amount, with: tipSlider) else {
                        print("Bill amount or tip cannot be negative")
                        return
                    }
                    
                    tipAmount = tip
                    totalAmount = amount + tipAmount
                }
            
            VStack {
                Text(tipAmount, format: .currency(code: "USD"))
                    .font(.title.bold())
                
                Text("Tip")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding (.top, 20)
            
            VStack {
                Text(totalAmount, format: .currency(code: "USD"))
                    .font(.title.bold())
                
                Text("Total")
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            
        }
        .padding(30)
    }
}

#Preview {
    ContentView()
}

struct Calculation {
    func calculateTip(of enteredAmount: Double, with tip: Double) -> Double? {
        guard enteredAmount >= 0 && tip >= 0 else { return nil }
        let tipPercentage = tip / 100
        return enteredAmount * tipPercentage
    }
}
