//
//  ContentView.swift
//  lab2
//
//  Created by Alan Valladares on 2/6/25.
//

import SwiftUI

struct jupiterView: View {
    
    var weightData: WeightData
    @Binding var messageEarth: String
    @Binding var messageMoon: String
    
    var jupiterWeight: Double { weightData.earthWeight * 2.4 }
    @Binding var path: NavigationPath
    
    var body: some View {
        Text("You are on Jupiter")
            .padding()
            .font(.title)
        
        Image("jupiter")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
        
        HStack{
            Text("Your weight on Earth: \(weightData.earthWeight, specifier: "%.2f") lbs")
        }
        .padding()
        
        HStack{
            Text("Your weight on the Moon: \(weightData.moonWeight, specifier: "%.2f") lbs")
        }
        .padding()
        
        HStack{
            Text("Your weight on Jupiter: \(jupiterWeight, specifier: "%.2f") lbs")
        }
        .padding()
        
        Text("I feel much Heavier!")
            .padding()
        
        Button("Return to Earth") {
            messageEarth = "Coming from Jupiter"
            path = NavigationPath()
        }
        .padding()

        Button("Return to Moon") {
            messageMoon = "Coming from Jupiter"
            path.removeLast()
        }
        .padding()
    }
}

#Preview {
    jupiterView(weightData: WeightData(earthWeight: 0, moonWeight: 0), messageEarth: .constant(""), messageMoon: .constant(""), path: .constant(NavigationPath()))
}
