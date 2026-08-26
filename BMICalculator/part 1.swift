//
//  part 1.swift
//  lab1
//
//  Created by Alan Valladares on 1/22/25.
//

import SwiftUI

struct part_1: View {
    
    @State var userWeight = ""
    @State var userHeight = ""
    @State var BMI: Double? = nil
    @State var idealWeight: Double? = nil
    @State var message = ""
    @State var messageColor: Color = .black
    
    var body: some View {
        
        VStack {
            
            Text("Ideal Weight")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding()
            
            // Weight
            HStack{
                Text("Weight (in pounds):")
                TextField("Enter your weight", text: $userWeight)
            }
            
            .padding()
            
            // Height
            HStack{
                Text("Height (in inches): ")
                TextField("Enter your height", text: $userHeight)
            }
            
            .padding()
            
            Button("Calculate BMI & Ideal Weight") {
                
                if let weight = Double(userWeight), let height = Double(userHeight), height > 0 {
                    
                    // BMI Calculation
                    BMI = (weight / (height * height)) * 703
                    
                    // Ideal Weight Calculation
                    idealWeight = 5 * 22 + (22/5) * (height - 60)
                    
                    if let idealWeight = idealWeight{
                        let weightDiff = weight - idealWeight
                        
                        if weightDiff > 20{
                            message = "You are overweight"
                            messageColor = .red
                        } else if weightDiff > 10 && weightDiff < 20 {
                            message = "You need to control your weight"
                            messageColor = .blue
                        } else if weightDiff > 5 && weightDiff < 10{
                            message = "You need to watch your weight gain"
                            messageColor = .purple
                        } else if weightDiff > (-5) && weightDiff < 5{
                            message = "You are in good shape"
                            messageColor = .green
                        } else{
                            message = "You need to eat more carbs"
                            messageColor = .yellow
                        }
                         
                    }
                } else {
                    BMI = nil
                    idealWeight = nil
                }
            }
            .padding(10)
            .foregroundColor(.purple)
            .border(Color.purple, width: 3)
            
            if let BMI = BMI {
                Text("Your BMI: \(String(format: "%.2f", BMI))")
                    .padding(10)
            }
                        
                        // Display Ideal Weight
            if let idealWeight = idealWeight {
                Text("Your Ideal Weight: \(String(format: "%.2f", idealWeight))")
                    .padding()
            }
            
            Text(message)
                .foregroundColor(messageColor)
                .padding()

        }
        .padding()
        
    }
}

#Preview {
    part_1()
}
