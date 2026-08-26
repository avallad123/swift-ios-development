//
//  ContentView.swift
//  lab6
//
//  Created by Alan Valladares on 3/30/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var cityVM = CityViewModel()
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 33.45, longitude: -112.07),
        span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
    )
    
    @State var selectedCity: city?
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: fetchCitiesForMap) {
                Text("Find Nearby Cities")
                    .padding()
            }
            .padding()
            
            Map(
                coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                annotationItems: {
                    if let city = selectedCity {
                        return [city]
                    } else {
                        return []
                    }
                }()
            ) { city in
                MapMarker(
                    coordinate: CLLocationCoordinate2D(
                        latitude: city.lat,
                        longitude: city.lng
                    )
                )
            }
            .frame(height: 300)
            
            List(cityVM.cities.prefix(10)) { city in
                VStack(alignment: .leading, spacing: 4) {
                    Text(city.name)
                        .font(.headline)
                    HStack {
                        Text("Country: \(city.countrycode)")
                        Spacer()
                        Text("Population: \(city.population)")
                    }
                    .font(.subheadline)
                }
                .padding()
                .onTapGesture {
                    selectedCity = city
                    withAnimation {
                        region.center = CLLocationCoordinate2D(
                            latitude: city.lat,
                            longitude: city.lng
                        )
                    }
                }
            }
        }
    }
    
    func fetchCitiesForMap() {
        let north = region.center.latitude + (region.span.latitudeDelta/2)
        let south = region.center.latitude - (region.span.latitudeDelta/2)
        let east = region.center.longitude + (region.span.longitudeDelta/2)
        let west = region.center.longitude - (region.span.longitudeDelta/2)
        
        cityVM.getJsonData(
            north: north,
            south: south,
            east: east,
            west: west
        )
    }
}

#Preview {
    ContentView()
}
