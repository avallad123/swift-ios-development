# Wallet Card App (SwiftUI)

An iOS app for entering credit/debit card details and previewing them as a realistic-looking card, built with SwiftUI `Form`/`Section` input and a live preview sheet. Built for a Principles of Mobile Computing course at Arizona State University (CSE 335).

## Overview

The app is split into two parts, as specified by the assignment:

1. **Input** — a sectioned form for entering card holder name, bank, card type, number, expiration date, secure code, and a card color
2. **Preview** — a styled card view showing the entered details, presented as a sheet when the user taps "Add Card to Wallet"

## Implementation notes

- **`ContentView`** builds the input form using `Form` and `Section` (Signature, Details, Card Color), binding each field to a `CardDetails` struct held in `@State`
- **Card type** selection uses a `Picker` driven by the `CardType` enum (Visa, Mastercard, Amex, Discover)
- **Card color** selection is a custom row of tappable `Circle` swatches, with a white stroke overlay highlighting the currently selected color
- **`CardPreview`** renders the entered data as a styled card using a color-filled `RoundedRectangle` with an overlaid `VStack` of labels, presented via `.sheet(isPresented:)`
- **`CardDetails.swift`** (the data model, `CardType` enum, and `Colors` palette) was provided as starter code for this assignment; the form UI, card preview, and state wiring in `ContentView.swift` and `WalletApp.swift` are the original implementation

## Skills demonstrated

SwiftUI forms and structured input (`Form`, `Section`, `Picker`, `DatePicker`), custom selectable UI controls, sheet-based presentation, and composing `ZStack`/`VStack`/`HStack` to build a polished visual preview from user-entered data.
