# Nearby Cities Explorer (SwiftUI, REST API, MapKit)

An iOS app that fetches nearby cities from the GeoNames web service based on the visible map region, displaying them in a list with name, country, and population, and plotting a selected city on the map. Built for a Principles of Mobile Computing course at Arizona State University (CSE 335).

## Overview

The app demonstrates calling a REST web service and parsing its JSON response into SwiftUI-driven UI:

1. The user taps "Find Nearby Cities," which computes a bounding box (north/south/east/west) from the current map region
2. That bounding box is sent to the GeoNames `citiesJSON` endpoint
3. The response is decoded into a list of cities and displayed (capped at the first 10, per the assignment spec)
4. Tapping a city in the list moves the map to center on it and drops a marker

## Implementation notes

- **`CityViewModel`** performs the network request with `URLSession`, decodes the response with `Codable` (`citydata`/`city` structs matching the GeoNames JSON shape), and publishes results back to the UI via `@Published` properties, dispatching UI updates onto the main thread
- **`ContentView`** computes the bounding box from the current `MKCoordinateRegion`'s center and span, triggers the fetch, and renders results in a `List` bound directly to the view model's published `cities` array
- Selecting a city updates both `selectedCity` (used to drop a `MapMarker` via `annotationItems`) and animates the map's region to re-center on that city

## Skills demonstrated

Calling a REST web service with `URLSession`, decoding JSON with `Codable`, binding asynchronous network results to SwiftUI state, and combining a list and an interactive `Map` driven by the same underlying data.

## Note

This project calls the GeoNames web service, which requires a registered (free) username as a query parameter.
