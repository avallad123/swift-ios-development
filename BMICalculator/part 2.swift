//
//  part 2.swift
//  lab1
//
//  Created by Alan Valladares on 1/22/25.
//

import SwiftUI

struct part_2: View {
    
    @State var sliderVal = 0.0
    @State var sliderVal2 = 0.0
    @State var BMI = 0.0
    @State var idealWeight = 0.0
    @State var weightDiff = 0.0
    @State var message = ""
    @State var messageColor: Color = .black
    
    var body: some View {
        VStack {
            
            Text("Ideal Weight")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(40)
            
            HStack{
                Text("Weight (in pounds): \(Int(sliderVal))")
            }
            
            Slider(value: $sliderVal, in: 50...300, step:1, onEditingChanged:{ _ in self.updateCalc()})
            
            HStack{
                Text("Height (in inches): \(Int(sliderVal2))")
            }
            
            Slider(value: $sliderVal2, in: 48...84, step:1, onEditingChanged:{ _ in self.updateCalc()})
            
            Text("Your BMI: \(String(format: "%.2f", BMI))")
                .padding(20)
            Text("Your Ideal Weight: \(String(format: "%.2f", idealWeight))")
            
            Text(message)
                .foregroundColor(messageColor)
                .padding()
            
        }
    }
    
    func updateCalc(){
        
        BMI = (sliderVal / (sliderVal2 * sliderVal2)) * 703
        
        idealWeight = 5 * 22 + (22/5) * (sliderVal2 - 60)
        
        weightDiff = sliderVal - idealWeight
            
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
}

#Preview {
    part_2()
}
