# Personal Finance Tracker (SwiftUI)

An iOS app for tracking daily income, expenses, and savings, built with SwiftUI following the MVVM (Model-View-ViewModel) architecture. Built for a software engineering course at Arizona State University.

## Overview

The app helps users log daily financial activity and understand their spending habits at a glance, without any backend or persistent storage — all state is held in memory for the current session, tracking the most recent seven days of activity.

## Features

- **Enter Data** — a form for logging daily income, expenses, and an expense category (Food, Entertainment, Transportation, Rent/Mortgage, Miscellaneous)
- **Activity** — a chronological list of the last seven days of entries, showing income, expenses, and computed daily savings (color-coded green/red)
- **How Am I Doing?** — an insights view that analyzes seven-day cumulative income and expenses to classify spending behavior as overspending, balanced, or saving well

## Architecture

Built with MVVM:

- **Model** — `FinanceEntry`, a simple struct holding a date, income, expenses, category, and computed savings for one day
- **ViewModel** — `FinanceViewModel`, an `ObservableObject` that owns the list of entries, adds new entries (capped at the most recent 7 days), and computes the spending insight based on average daily income, expenses, and savings
- **Views** — `ContentView` hosts a `TabView` switching between `EnterDataView`, `ActivityView`, and `InsightsView`, each bound to the shared view model via `@ObservedObject`/`@StateObject`

## Insight logic

Spending behavior is classified from seven-day averages:

- Average daily expenses > 30% of average daily income → "You are overspending!"
- Average daily savings between 10-30% of average daily income → "You have a balanced budget!"
- Average daily savings > 30% of average daily income → "You are saving well!"

## Skills demonstrated

SwiftUI, MVVM architecture, `ObservableObject`/`@Published` state management, form handling and data validation, and translating a written product spec into a working, testable app.
