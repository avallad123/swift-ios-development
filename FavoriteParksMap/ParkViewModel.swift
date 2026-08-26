//
//  ParkViewModel.swift
//  lab5
//
//  Created by Alan Valladares on 3/16/25.
//

import Foundation
import SwiftUI
import MapKit

struct Park: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let description: String
    let imageName: String
    let coordinate: CLLocationCoordinate2D
}

class ParkViewModel: ObservableObject {
    @Published var parks: [Park] = [
        
        Park(name: "Grand Canyon",
             location: "Arizona, USA",
             description: "Has a depth of over a mile",
             imageName: "grandcanyon",
             coordinate: CLLocationCoordinate2D(latitude: 36.05, longitude: -112.12)
        ),
        Park(name: "Joshua Tree",
             location: "California, USA",
             description: "Has succulents with a unique form and leaves",
             imageName: "joshua",
             coordinate: CLLocationCoordinate2D(latitude: 33.87, longitude: -115.90)
        ),
        Park(
            name: "Yellowstone",
            location: "Wyoming, USA",
            description: "First national park in the world",
            imageName: "yellowstone",
            coordinate: CLLocationCoordinate2D(latitude: 44.59, longitude: -110.56)
        ),
        Park(
            name: "Yosemite",
            location: "California, USA",
            description: "Famous for its giant ancient sequoia trees",
            imageName: "yosemite",
            coordinate: CLLocationCoordinate2D(latitude: 37.86, longitude: -119.53)
        ),
        Park(name: "Zion",
             location: "Utah, USA",
             description: "Contains sandstone cliffs and deep canyons",
             imageName: "zion",
             coordinate: CLLocationCoordinate2D(latitude: 37.29, longitude: -113.02)
        ),
    ]
    
    func addPark(_ park: Park) {
        parks.append(park)
    }

    func deletePark(at offsets: IndexSet) {
        parks.remove(atOffsets: offsets)
    }
}
