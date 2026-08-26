//
//  AddParkView.swift
//  lab5
//
//  Created by Alan Valladares on 3/16/25.
//

import SwiftUI
import MapKit

struct AddParkView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ParkViewModel
    
    @State var name = ""
    @State var location = ""
    @State var description = ""
    @State var latitudeText: String = ""
    @State var longitudeText: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Park Details")) {
                    TextField("Name", text: $name)
                    TextField("Location", text: $location)
                    TextField("Description", text: $description)
                    TextField("Latitude", text: $latitudeText)
                    TextField("Longitude", text: $longitudeText)
                }
                
                Button("Add Park") {
                    addPark()
                }
            }
            .navigationTitle("Add New Park")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func addPark() {
            let latitude = Double(latitudeText) ?? 0.0
            let longitude = Double(longitudeText) ?? 0.0
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

            let imageName = "defaultParkImage"

            let newPark = Park(
                name: name,
                location: location,
                description: description,
                imageName: imageName,
                coordinate: coordinate
            )

            viewModel.addPark(newPark)
            dismiss()
    }
}
