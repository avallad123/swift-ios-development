# Book List (SwiftUI, MVVM)

An iOS app for managing a personal book collection — add, delete, search, edit, and page through book records — built with SwiftUI following the MVVM architecture and using `NavigationView`, `toolbar`/`ToolbarItem`, and `.alert` throughout. Built for a Principles of Mobile Computing course at Arizona State University (CSE 335).

## Features

- **Add** — enter title, author, genre, and price for a new book via an alert form, accessible from a toolbar button
- **Delete** — remove a book by entering its title, via a toolbar button
- **Search & Edit** — search for a book by title in a dedicated sheet (`SearchBookView`); if found, its details populate an editable form, and saving updates the record in place
- **Navigation** — step through the book collection with Previous/Next toolbar buttons, with alerts shown at the start/end of the list rather than allowing out-of-bounds navigation

## Architecture

Follows MVVM as required by the assignment:

- **Model** — `Book`, a simple `Identifiable` struct (title, author, genre, price)
- **ViewModel** — `BookViewModel`, an `ObservableObject` owning the book collection (`booksMade`) and current index (`currentBook`), exposing `addBook`, `deleteBook`, `searchBook`, `editBook`, and `nextBook`/`prevBook` navigation methods — all UI-independent logic lives here
- **Views** — `ContentView` hosts the main book display, toolbar actions, and alerts; `SearchBookView` is a separate sheet-presented view for search-and-edit, communicating back to the shared view model via `@ObservedObject` and to `ContentView` via `@Binding` state

## Implementation notes

- All primary actions (Add, Delete, Search, Previous, Next) are implemented as `ToolbarItem`s, split between leading/trailing navigation bar placement and a bottom toolbar for pagination, per the assignment's UI requirements
- Add and Delete use SwiftUI's `.alert` with embedded form fields; Search/Edit uses a full `.sheet` instead, since it needed a larger, more structured UI than an alert could reasonably hold
- Boundary navigation (attempting Previous at the first book or Next at the last) triggers dedicated alerts rather than silently doing nothing

## Skills demonstrated

SwiftUI MVVM architecture, `ObservableObject`/`@Published` state management across multiple views, toolbar-driven UI design, alert- and sheet-based user input, and implementing full CRUD-style operations (create, read/search, update, delete) over an in-memory collection.
