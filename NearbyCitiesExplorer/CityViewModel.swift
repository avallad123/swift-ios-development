//
//  CityViewModel.swift
//  lab6
//
//  Created by Alan Valladares on 3/30/25.
//

import Foundation

struct citydata : Decodable
{
    let geonames: [city]
}

struct city : Decodable, Identifiable {
    let id = UUID()
    let name: String
    let countrycode: String
    let population: Int
    let lat: Double
    let lng: Double
}

class CityViewModel : ObservableObject {
    @Published var cityName: String?
    @Published var country: String?
    @Published var population: String?
    @Published var latitude: String?
    @Published var longitude: String?
    @Published var cities: [city] = []
    
    init() {
        cityName = "fetching data..."
        country = "fetching data..."
        population = "fetching data..."
        latitude = "fetching data..."
        longitude = "fetching data..."
    }
    
    func getJsonData(north: Double, south: Double, east: Double, west: Double) {
        let urlAsString = "http://api.geonames.org/citiesJSON?north="+String(north)+"&south="+String(south)+"&east="+String(east)+"&west="+String(west)+"&username=PLACEHOLDER"
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(citydata.self, from: data!)
                DispatchQueue.main.async {
                    self.cities = decodedData.geonames
                    
                    if let firstCity = decodedData.geonames.first {
                        self.cityName = firstCity.name
                        self.country = firstCity.countrycode
                        self.population = String(firstCity.population)
                        self.latitude = String(firstCity.lat)
                        self.longitude = String(firstCity.lng)
                    }
                }
                
            } catch {
                print("error: \(error)")
            }
        })
        jsonQuery.resume()
    }
}
