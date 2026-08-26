
import SwiftUI

struct ContentView: View {
    
    @State private var cardDetails = CardDetails()
    @State var showCard = false
    
    var body: some View {
        VStack {
            Form {
                Section("Signature") {
                    TextField("Card Holder Name", text: $cardDetails.holderName)
                    TextField("Bank Name", text: $cardDetails.bank)
                    Picker("Card Type", selection: $cardDetails.type) {
                        ForEach(CardType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
                Section("Details"){
                    TextField("Card Number", text: $cardDetails.number)
                    TextField("Secure Code", text: $cardDetails.secureCode)
                    
                    DatePicker("Valid Through", selection: $cardDetails.validity, displayedComponents: .date)
                }
                
                Section("Card Color"){
                    HStack {
                        ForEach(Colors.all, id: \..self) { color in Circle()
                                .fill(color)
                                .frame(width: 30, height: 30)
                                .onTapGesture {
                                    cardDetails.color = color
                                }
                            .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: cardDetails.color == color ? 6 : 0)
                            )
                        }
                    }
                }
                
                Section(){
                    Button("Add Card to Wallet"){
                        showCard = true
                    }
                }
            }
            .sheet(isPresented: $showCard){
                CardPreview(cardDetails: cardDetails)
            }
        }
    }
}

struct CardPreview: View {
    var cardDetails: CardDetails
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(cardDetails.color)
                .frame(height: 200)
                .overlay(
                    VStack(alignment: .leading, spacing: 10) {
                        HStack{
                            Text(cardDetails.bank)
                                .font(.title)
                                .foregroundColor(.white)
                            Text(cardDetails.type.rawValue)
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        Text(cardDetails.holderName)
                            .font(.headline)
                            .foregroundColor(.white)
                        HStack{
                            Text("Expires: \(cardDetails.formattedValidity)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            Text("Secure Code:\(cardDetails.secureCode)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        Text(cardDetails.number)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding()
                )
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

