# Space Walk Navigator (SwiftUI)

An iOS app that calculates and displays a person's weight on Earth, the Moon, and Jupiter, using SwiftUI's `NavigationStack` and `NavigationPath` to pass data forward and backward across a multi-screen navigation flow. Built for a Principles of Mobile Computing course at Arizona State University (CSE 335).

## Overview

The user enters their weight on an Earth screen, then navigates forward through Moon and Jupiter screens, each computing that planet's equivalent weight from the previous value. Navigating backward from Jupiter or the Moon displays a contextual message on the destination screen indicating where the user came from.

- **Earth → Moon**: Moon gravity is 1/6 of Earth's
- **Moon → Jupiter**: Jupiter gravity is 2.4× Earth's
- Backward navigation (Jupiter → Moon, Jupiter → Earth, Moon → Earth) each show a "Coming from [planet]" message on arrival

## Implementation notes

- **`ContentView`** (Earth screen) holds the root `NavigationStack` and a single shared `NavigationPath`, taking the user's Earth weight as a `Double` and pushing it onto the path
- **`moonVIew`** receives the Earth weight, computes Moon weight, and pushes a `WeightData` struct (bundling Earth + Moon weight) onto the path when continuing to Jupiter
- **`jupiterView`** receives the full `WeightData`, computes Jupiter weight from it, and exposes two "return" actions: resetting the path entirely (back to Earth) or popping one level (back to the Moon)
- Backward-navigation messages (`messageEarth`, `messageMoon`) are passed down as `@Binding`s from `ContentView` so any screen in the stack can set the message the *previous* screen will display on return
- Uses a single shared `NavigationPath` with `.navigationDestination(for:)` per data type (`Double` for the Earth→Moon transition, `WeightData` for Moon→Jupiter), per the assignment's `NavigationPath` requirement

## Skills demonstrated

SwiftUI `NavigationStack`/`NavigationPath`-based multi-screen navigation, passing typed data forward through a navigation path, using `@Binding` to let child views communicate back to parent/sibling views, and managing cross-screen state without a central view model.
