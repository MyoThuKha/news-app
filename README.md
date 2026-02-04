<p float="left">
  <img src="screenshots/home-light.png" width="22%" />
  <img src="screenshots/detail-light.png" width="22%" />
  <img src="screenshots/home-offline-dark.png" width="22%" />
  <img src="screenshots/detail-dark.png" width="22%" />
</p>



# 🗞️ News App

An  **offline-first news application** built with **Flutter**, using **Clean Architecture + BLoC**.  
This project was created for a mobile coding assessment to demonstrate architecture, state management, caching, testing, and UX best practices.

---

## 🚀 Features

- Offline-first architecture with local cache fallback
- Featured headline + main news list
- News detail view with Save & Share
- Saved News screen
- Light / Dark Mode with Material 3
- Pull-to-refresh support
- Network awareness with cached indicator & last updated timestamp

---

## 🧱 Architecture Overview

This project follows **Clean Architecture** with a feature-based modular structure.

### Folder Responsibilities

```text
lib/
├── config/
│   ├── database/        → Drift database, DAOs & tables
│   ├── routes/          → App routing configuration
│   └── themes/          → Material 3 theme definitions
│
├── core/
│   ├── constants/       → API constants & shared values
│   ├── domain/          → Global entities
│   ├── network/        → Dio client & connectivity service
│   ├── ui/              → Shared widgets & UI helpers
│   └── utils/           → Date & formatting utilities
│
├── features/
│   ├── news/            → News feature (Clean Architecture layers)
│   │   ├── data/        → Models, mappers, datasources, repos
│   │   ├── domain/      → Entities, usecases, repositories
│   │   └── presentation/→ BLoC, pages, widgets
│   │
│   ├── saves/           → Saved news feature
│   ├── theme/           → Theme persistence & BLoC
│   └── presentation/    → Home / wrapper pages
│
├── injection/           → GetIt dependency injection setup
└── main.dart            → App entry point
```



Each feature is split into:

Data → API, DB, Models, Mappers

Domain → UseCases & Repositories

Presentation → BLoC + UI

## 🛠 Tech Stack

## 🛠 Tech Stack

| Area              | Tool / Library        |
|-------------------|------------------------|
| Language          | Dart                   |
| Framework         | Flutter                |
| Architecture      | Clean Architecture     |
| State Management  | Bloc / Flutter Bloc    |
| Networking        | Dio                    |
| Database          | Drift (SQLite)         |
| Dependency Injection | GetIt               |
| UI                | Material 3             |
| Testing (Bloc)    | bloc_test              |
| Testing (UI)      | Flutter Finder API     |
| Linting           | flutter_lints & bloc_lint          |

## 🧪 Testing
🔹 BLoC Tests

Implemented using bloc_test

Verifies:
- State transitions
- Event → State behavior
- Error handling

🔹 UI / Widget Tests

- Uses Flutter Finder API

- Ensures:

  - Widgets render correctly

  - User interactions behave as expected

Run all tests:

```
flutter test
```

## 🎨 Material 3 Theming

The app fully supports:

☀️ Light Mode

🌙 Dark Mode

🌓 System 

Built using Material 3 color theme, with:

 - Centralized theme config

 - Theme persistence using local storage

Theme state managed via BLoC


## 🔌 Dependency Injection (GetIt)

The project uses GetIt for:

- BLoC injection

- Repository & UseCase wiring

- Network & database services

Located in:

lib/injection/


Each feature registers its own dependencies cleanly.

## 🌐 API Setup

Data source:
👉 https://newsapi.org/

You must provide an API key via Dart define.

▶️ Run the App

```
flutter run --dart-define=NEWS_API_KEY=YOUR_API_KEY_HERE
```


🔑 Get your API key by registering at:
 https://newsapi.org/


## 🧠 Offline-First Logic

On launch, app attempts to fetch latest news

If offline:

Loads cached data from local DB

Shows "Using Cached Data" indicator

Displays last updated timestamp on detail page

