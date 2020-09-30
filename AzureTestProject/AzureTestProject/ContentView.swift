//
//  ContentView.swift
//  AzureTestProject
//
//  Created by Chloe Norris on 9/24/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalInput: Double? = 18.94
    @State private var selectedTipPercentage = 0
    
    private var currencyFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        return f
    }()
    
    private let tipPercentages = [0.15, 0.2, 0.50]
    
    private var percentageFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .percent
        return f
    }()
    
    private var tipAmount: Double {
        let total = totalInput ?? 0
        let tipPercent = tipPercentages[selectedTipPercentage]
        return total * tipPercent
    
    }
    
    private var formattedTipAmount: String {
        currencyFormatter.string(from: NSNumber(value: tipAmount)) ?? "--"
    }
    
    private var finalTotal: Double {
        (totalInput ?? 0) + tipAmount
    }
   
    private var formattedFinalTotal: String {
        currencyFormatter.string(from: NSNumber(value: finalTotal)) ?? "--"
    }
    
    
    var body: some View {
        NavigationView {
            VStack(spacing:20) {
                Spacer()
                
                TextField("tlInput", value: $totalInput, formatter: currencyFormatter)
                    .font(.largeTitle)
                    .padding()
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                
                selectTip
                
                Divider()
                
                summaryLine(label: "Tip:", amount: formattedTipAmount, color: .gray)
                summaryLine(label: "Total:", amount: formattedFinalTotal, color: .green)
                
                Spacer()
            }
            .background(Color(white: 0.85, opacity: 1.0))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text("Tip Calculator"))
            
        }
        
    }
    
    private func summaryLine(label: String, amount: String, color: Color) -> some View {
        HStack{
            Spacer()
            Text(label)
                .font(.title)
                .foregroundColor(color)
            Text(amount)
                .font(.title)
                .foregroundColor(color)
        }.padding(.trailing)
    }
    
    private var selectTip: some View {
        Picker(selection: $selectedTipPercentage, label: Text("What would you like to tip?")) {
            ForEach(0..<tipPercentages.count) { index in
               // let tipPercent = self.tipPercentages[index]
               // let label = formatPercent(tipPercent)
               // Text(label).tag(index)
                Text(self.formatPercent(self.tipPercentages[index])).tag(index)
            }
                    }.pickerStyle(SegmentedPickerStyle())
    }
    
    private func formatPercent(_ p: Double) -> String {
        percentageFormatter.string(from: NSNumber(value: p)) ?? "--"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
