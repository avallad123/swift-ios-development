# Personal Finance Tracker with Firebase (SwiftUI)

An extension of the original Personal Finance Tracker app, adding cloud data persistence via Firebase Firestore.

## What changed from the original

- Financial entries are now persisted to a **Firestore** collection (`financialEntries`) instead of living only in memory
- Users now select a **date** for each entry via a `DatePicker`, rather than the entry always being "today"
- The app fetches and displays the seven most recent entries from Firestore on load, ordered by date
- Added loading state and error handling (via `@Published isLoading` / `alertMessage`) around all Firestore reads/writes

## Architecture

Still MVVM, extended to talk to Firestore:

- **Model** — `FinanceEntry`, now `Identifiable` with a Firestore document ID, plus `toDict()` and a `data:`-based initializer to convert to/from Firestore's document format (using `Timestamp` for dates)
- **ViewModel** — `FinanceViewModel`, an `ObservableObject` that owns Firestore reads (`fetchEntries`, ordered by date, limited to 7) and writes (`addEntry`), tracks loading/error state, and computes spending insights from the fetched entries
- **Views** — `EnterDataView` now includes a date picker and shows a progress indicator while saving; `ActivityView` and `InsightsView` handle loading and empty states in addition to displaying data

## Insight logic

Same three-tier classification as the original, now computed from live Firestore data: overspending (avg. daily expenses > 30% of avg. daily income), balanced budget (avg. daily savings 10-30% of income), or saving well (avg. daily savings > 30% of income).

## Skills demonstrated

SwiftUI, MVVM with an asynchronous backend, Firebase/Firestore integration (reads, writes, ordering, limits), async state management (loading and error states), and extending an existing codebase to add a new capability without changing its core UI structure.

## Note

`GoogleService-Info.plist` (Firebase project configuration) is intentionally excluded from this repository, as it contains project-specific credentials.
