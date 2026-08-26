//
//  ParkDetailView.swift
//  lab5
//
//  Created by Alan Valladares on 3/16/25.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ParkDetailView: View {
    let park: Park
    @State var region: MKCoordinateRegion
    @State var searchText = ""
    @State var markers: [Place] = []

    init(park: Park) {
        self.park = park
        _region = State(initialValue: MKCoordinateRegion(
            center: park.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(park.imageName)
                .resizable()
                .scaledToFit()

            Text(park.name)
                .font(.largeTitle)
                .bold()

            Text(park.description)

            Text("Latitude: \(park.coordinate.latitude)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Longitude: \(park.coordinate.longitude)")
                .font(.subheadline)
                .foregroundColor(.gray)

            searchBar

            Map(coordinateRegion: $region, annotationItems: [Place(name: park.name, coordinate: park.coordinate)] + markers) { item in
                MapMarker(coordinate: item.coordinate)
            }
            .frame(height: 300)

        }
        .padding()
    }

    private var searchBar: some View {
        HStack {
            Button {
                performSearch()
            } label: {
                Image(systemName: "location.magnifyingglass")
                    .resizable()
                    .foregroundColor(.accentColor)
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 12)
            }

            TextField("Search for coffee, pizza, movie, etc", text: $searchText)
                .foregroundColor(.primary)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.black.opacity(0.1))
        }
        .padding(.horizontal)
    }

    private func performSearch() {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText
        searchRequest.region = region

        MKLocalSearch(request: searchRequest).start { response, error in
            guard let response = response else {
                print("Search error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }

            region = response.boundingRegion

            markers = response.mapItems.map { item in
                Place(
                    name: item.name ?? "Unknown Place",
                    coordinate: item.placemark.coordinate
                )
            }
        }
    }
}
