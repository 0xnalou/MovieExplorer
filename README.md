
# 🎬 MovieExplorer

MovieExplorer is an iOS application that displays movie data from The Movie Database (TMDb) API. Users can browse popular movies, view detailed information, and access offline support thanks to local caching.

---

## 📦 Features

- List of popular movies with poster, title, and release year.
- Detail view with overview, rating, genres, and release date.
- Infinite scrolling support with load-more functionality.
- Offline access through local Realm database.
- Smooth UI using SwiftUI and MVVM-C architecture.

---

## 🧱 Tech Stack

| Layer          | Tools / Frameworks |
|----------------|--------------------|
| UI             | SwiftUI            |
| Architecture   | MVVM-C (via `MVVMCModule`) |
| Networking     | Alamofire          |
| DI             | Swinject           |
| Local Storage  | Realm              |

---

## 📁 Project Structure

The project is organized using modular architecture principles and MVVM-C pattern, divided into clear layers and responsibilities:

### 🔹 `Modules/`
Contains reusable modules:
- **Networking/**: Networking abstraction layer using Alamofire.

### 🔹 `MovieExplorer/Application/`
App lifecycle & dependency injection setup:
- **AppSessionManager/**: Session-related logic and protocols.
- **Configuration/**: App-wide configurations and environment values.
- **Dependencies/**: Network DI setup.
- `AppDelegate`, `SceneDelegate`, `MovieExplorerApp`: Entry points.

### 🔹 `MovieExplorer/Data/`
Handles data sources:
- **Movie/**: Handles API requests/responses and repositories (`MovieRepositoryImpl`).
- **StorageRepository/**: Local storage logic using Realm (`StorageRepositoryImpl`).

### 🔹 `MovieExplorer/Domain/`
Business logic layer:
- **Model/Realm/**: Realm-specific models (e.g. `RMMovie`).
- **Usecase/**: Use cases that bridge the repository and presentation layers (`GetMovieListUseCase`, `StorageLocalMoviesUseCase`).

### 🔹 `MovieExplorer/General/`
Shared utilities & components:
- **Component/**: UI components like `Toast`, `FlowLayout`.
- **DesignToken/**: Centralized color and size system.
- **Extensions/**: Swift and UIKit extensions.
- **Modifier/**: SwiftUI view modifiers.
- **WrapModule/**: Wrappers to integrate Combine, MVVMCModule, and Networking.

### 🔹 `MovieExplorer/Presentation/`
UI Presentation layer base on MVVM-C (including `Coordinator`, `Dependency`, `View`, `ViewModel`), structured by feature:
- **AppStart/**: Initial boot flow.
- **MovieList/**: List screen.
- **MovieDetail/**: Detail screen

---

This structure promotes scalability, testability, and clean separation of concerns.

---

## 🚀 Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourname/MovieExplorer.git
   ```

2. Open `MovieExplorer.xcodeproj` in Xcode.

3. open a file `AppConfiguration.swift` with the following content:
   ```swift
   var apiKey = "YOUR_API_KEY"
   var accessToken = "YOUR_ACCESS_TOKEN"    
   ```

4. Run the app with `⌘ + R`.

---

## 🧠 Architecture Reasoning

The app uses a modular architecture based on **MVVM-C** to ensure clear separation of concerns and easy scalability.

The `MVVMCModule` is a personal Swift package I developed to implement the Coordinator Pattern in SwiftUI. It provides a scalable and testable approach to navigation, especially useful when building apps with multiple flows and nested features.

Realm is chosen as the local storage solution to provide persistent offline access and handle infinite scrolling use cases without data inconsistency between server and local cache.

---

## ✅ Deliverables Checklist

- [x] Home screen (movie list)
- [x] Detail screen (movie details)
- [x] Offline mode support
- [x] Modular MVVM-C design
- [x] README with setup and architectural reasoning
