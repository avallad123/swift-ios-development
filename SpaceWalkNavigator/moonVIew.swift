//
//  ContentView.swift
//  lab2
//
//  Created by Alan Valladares on 2/6/25.
//

import SwiftUI

struct WeightData: Hashable {
    var earthWeight: Double
    var moonWeight: Double
}

struct moonVIew: View {
    
    @State var earthWeight: Double
    @Binding var path: NavigationPath
    @Binding var messageMoon: String
    @Binding var messageEarth: String
    
    var moonWeight: Double {earthWeight / 6.0}
    
    var body: some View {
        VStack {
            Text("You are on the Moon")
                .padding()
                .font(.title)
            
            Image("moon")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            if !messageMoon.isEmpty {
                Text(messageMoon)
                .foregroundColor(.blue)
                .padding()
            }
            
            HStack {
                Text("Your weight on Earth is... \(earthWeight, specifier: "%.2f") lbs")
            }
            .padding()
            
            HStack {
                Text("Your weight on the Moon is... \(moonWeight, specifier: "%.2f") lbs")
            }
            .padding()
            
            Text("I feel much Lighter!")
                .padding()
            
            Button("Return to Earth"){
                messageEarth = "Coming from Moon"
                path.removeLast()
            }
            .padding()
            
            NavigationLink("Go to Jupiter", value: WeightData(earthWeight: earthWeight, moonWeight: moonWeight))
                .padding()
        }
        .navigationDestination(for: WeightData.self) { weightData in
            jupiterView(weightData: weightData, messageEarth: $messageEarth, messageMoon: $messageMoon, path: $path)
        }
    }
}

#Preview {
    moonVIew(earthWeight: 0, path: .constant(NavigationPath()), messageMoon: .constant(""), messageEarth: .constant(""))
}
