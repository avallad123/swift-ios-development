//
//  ContentView.swift
//  lab1
//
//  Created by Alan Valladares on 1/19/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                
                Text("Lab 1")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: part_1()){
                    Text("Part 1: Using Keyboard")
                }
                .padding(20)

                
                NavigationLink(destination: part_2()){
                    Text("Part 2: Using Sliders")
                }
                
                Spacer()
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
