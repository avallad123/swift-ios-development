# BMI & Ideal Weight Calculator (SwiftUI)

A two-part iOS app that calculates BMI and ideal weight from user input, using two different SwiftUI input methods — text fields and sliders. Built for a Principles of Mobile Computing course at Arizona State University (CSE 335).

## Overview

The app has a simple navigation structure: a home screen links to two separate implementations of the same calculation, demonstrating two different ways to capture numeric input in SwiftUI.

- **Part 1** — weight and height entered via text fields, calculated on a button tap
- **Part 2** — weight and height selected via sliders, recalculating live as the sliders move

## Calculations

Both parts implement the same formulas:

- **BMI** = (weight in pounds / (height in inches)²) × 703
- **Ideal weight** = 5 × BMI + (BMI / 5) × (height in inches − 60)

Based on the difference between current weight and ideal weight, the app displays a color-coded message:

| Weight vs. ideal | Message | Color |
|---|---|---|
| More than 20 lbs over | "You are overweight" | Red |
| 10–20 lbs over | "You need to control your weight" | Blue |
| 5–10 lbs over | "You need to watch your weight gain" | Purple |
| Within ±5 lbs | "You are in good shape" | Green |
| More than 5 lbs under | "You need to eat more carbs" | Yellow |

## Implementation notes

- **Part 1** (`part_1.swift`) uses `@State` string bindings for text field input, parses them to `Double` on submit, and guards against invalid/non-numeric input before calculating
- **Part 2** (`part_2.swift`) uses `@State` sliders bound directly to numeric values (weight range 50–300 lbs, height range 48–84 in), recalculating on every slider change via `onEditingChanged`
- Navigation between the two parts is handled with `NavigationView` and `NavigationLink` from a shared `ContentView` home screen

## Skills demonstrated

SwiftUI fundamentals (state management, text fields, sliders, conditional UI, navigation), translating a mathematical spec into working app logic, and implementing the same feature two different ways to compare input UX patterns.
