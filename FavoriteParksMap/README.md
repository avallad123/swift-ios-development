# Favorite Parks (SwiftUI, MapKit)

An iOS app for browsing, adding, and deleting favorite national parks, with a detail view showing each park's location on an interactive map and live place search (coffee, pizza, etc.) around it. Built with MVVM architecture for a Principles of Mobile Computing course at Arizona State University (CSE 335).

## Features

- **Park list** — a `List` of parks (pre-loaded with five: Grand Canyon, Joshua Tree, Yellowstone, Yosemite, Zion) showing each park's image, name, and location, with swipe-to-delete and an `EditButton`
- **Add Park** — a form sheet for entering a new park's name, location, description, and coordinates (latitude/longitude), falling back to a default image if none is provided
- **Park detail** — tapping a park navigates to a detail view showing its image, description, coordinates, and an interactive `Map` centered on its location
- **Nearby place search** — from the detail view, users can search for places (e.g. "coffee", "pizza") near the park using `MKLocalSearch`; results are plotted on the map as annotated markers and the map region updates to fit them

## Architecture

Follows MVVM:

- **Model** — `Park` (name, location, description, image, `CLLocationCoordinate2D`) and `Place` (used for search result annotations)
- **ViewModel** — `ParkViewModel`, an `ObservableObject` holding the pre-loaded park list and exposing `addPark`/`deletePark`
- **Views** — `ContentView` (list + navigation), `AddParkView` (add form, presented as a sheet), `ParkDetailView` (detail + map + search, using local `@State` for the map region and search results since that state doesn't need to be shared elsewhere)

## Implementation notes

- `ParkDetailView` initializes its `MKCoordinateRegion` from the selected park's coordinate, then updates it dynamically as search results come back
- Place search uses `MKLocalSearch.Request` with a natural-language query, mapping results into `Place` structs for annotation on the map
- Uses `NavigationStack`/`NavigationLink` for list-to-detail navigation and `.sheet` for the add-park flow, per the assignment's required navigation pattern

## Skills demonstrated

SwiftUI MVVM architecture, `List` with swipe-to-delete and edit mode, `NavigationStack`-based navigation, MapKit integration (`Map`, `MKCoordinateRegion`, `MapMarker`), and live location search with `MKLocalSearch`.
