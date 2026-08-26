//
//  ContentView.swift
//  lab2
//
//  Created by Alan Valladares on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    @State private var userWeight = ""
    @State var dataFromMoon = ""
    @State var messageEarth = ""
    @State var messageMoon = ""

    var body: some View {
        NavigationStack(path: $path){
            VStack {
                Text("Welcome to Space Walk App")
                    .padding()
                
                Text("You are on Earth Now")
                    .padding()
                
                if !messageEarth.isEmpty {
                    Text(messageEarth)
                        .foregroundColor(.blue)
                        .padding()
                }
                
                HStack {
                    Text("Enter your weight: ")
                    TextField("In Pounds", text: $userWeight)
                }
                .padding()
                
                Image("earth")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                if let weight = Double(userWeight) {
                    NavigationLink("Go to Moon", value: weight)
                        .padding()
                } else {
                    Text("Enter a valid number to proceed")
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .navigationDestination(for: Double.self){ weight in
                moonVIew(earthWeight: weight, path: $path, messageMoon: $messageMoon, messageEarth: $messageEarth)
            }
        }
    }
}

#Preview {
    ContentView()
}
