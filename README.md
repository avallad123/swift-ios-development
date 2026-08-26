# Swift & iOS Development

A collection of iOS apps built with SwiftUI, spanning fundamentals (state management, navigation) through more advanced integrations (Firebase, MapKit, REST APIs). Built across a Mobile App Development course at Arizona State University.

## Projects

### [`PersonalFinanceTracker/`](./PersonalFinanceTracker)
A daily income/expense/savings tracker with spending-habit insights, built with MVVM and in-memory state.

### [`PersonalFinanceTracker-Firebase/`](./PersonalFinanceTracker-Firebase)
An extension of the above, adding cloud persistence via Firebase Firestore — async reads/writes, loading states, and date-based entries.

### [`BMICalculator/`](./BMICalculator)
A two-part BMI and ideal-weight calculator, implementing the same logic with two different SwiftUI input methods (text fields vs. sliders).

### [`SpaceWalkNavigator/`](./SpaceWalkNavigator)
A multi-screen app calculating weight across Earth, the Moon, and Jupiter, built around `NavigationStack`/`NavigationPath` to pass typed data forward and backward through the navigation flow.

### [`WalletCardApp/`](./WalletCardApp)
A credit/debit card entry form with a live, styled card preview — sectioned forms, custom color selection, and sheet-based presentation.

### [`BookListMVVM/`](./BookListMVVM)
A book collection manager (add/delete/search/edit/navigate) built strictly around MVVM, `toolbar`/`ToolbarItem`, and `.alert`-driven UI.

### [`FavoriteParksMap/`](./FavoriteParksMap)
A national parks list-and-detail app with MapKit integration — each park's location is shown on an interactive map with live nearby-place search.

### [`NearbyCitiesExplorer/`](./NearbyCitiesExplorer)
An app that calls the GeoNames REST API to fetch and display nearby cities based on the current map region, combining a decoded JSON list with a synced map view.

## Progression

These projects build in complexity across a semester:

1. **State fundamentals** — `PersonalFinanceTracker`, `BMICalculator`: basic `@State`/`@Published` and MVVM
2. **Navigation** — `SpaceWalkNavigator`, `BookListMVVM`: passing data across multiple views, toolbar-driven UI
3. **Structured input & data modeling** — `WalletCardApp`, `FavoriteParksMap`: forms, custom controls, CRUD-style operations
4. **External data & services** — `PersonalFinanceTracker-Firebase`, `NearbyCitiesExplorer`, `FavoriteParksMap`: cloud persistence, REST APIs, MapKit and location-based search

## Skills demonstrated

SwiftUI (state management, forms, navigation, sheets, alerts), MVVM architecture, Firebase/Firestore integration, MapKit and location-aware features, REST API calls with `URLSession` and `Codable` JSON decoding, and translating written product/assignment specs into working, testable apps.

## Note

These were built as part of graded university coursework. Each project was graded on implementation outcome (UI, architecture, functionality) rather than an autograder, and each subfolder includes the original project files.
