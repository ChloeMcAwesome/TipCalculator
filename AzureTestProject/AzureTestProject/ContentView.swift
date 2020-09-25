//
//  ContentView.swift
//  AzureTestProject
//
//  Created by Chloe Norris on 9/24/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalInput: Double? = 18.94
    
    private var currencyFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        return f
    }()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                TextF($totalInput, formatter: currencyFormatter)
                Spacer()
            }
            .background(Color(white: 0.85, opacity: 1.0))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarTitle(Text("Tip Calculator"))
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
