# Exchange App

## Overview

This is a Flutter application for displaying a list of assets (cryptocurrencies) with their prices, using a clean architecture and dependency injection. The app uses Dio for networking, Provider for state management, and supports localization.

---

## Project Structure

```
lib/
│
├── app.dart                # Main app widget, theme and localization setup
├── main.dart               # Entry point, environment selection
├── app_flow.dart           # App DI and root widget flow
├── runner.dart             # App runner with DI and environment
│
├── app/
│   ├── config/             # App configuration and environment
│   │   ├── build_type.dart
│   │   ├── environment.dart
│   ├── data/               # Networking and API helpers
│   │   ├── coin_cap_interceptor.dart
│   │   ├── dio_api.dart
│   │   ├── service_result.dart
│   ├── design/             # Design system (e.g., SizeConfig)
│   ├── di/                 # Dependency injection setup
│   │   ├── app_scope.dart
│   │   ├── app_scope_register.dart
│   │   ├── di_scope.dart
│   ├── env/                # Environment variables and generated files
│   ├── error/              # Error and exception handling
│   │   ├── network_exceptions.dart
│   │   ├── network_exceptions.freezed.dart
│   ├── theme/              # Theme and text styles
│   │   ├── theme.dart
│   ├── utils/              # Utilities and extensions
│
├── home/
│   ├── asset_view_model_provider.dart
│   ├── models/             # Data models (e.g., Currency, Asset)
│   ├── services/           # API services (e.g., ApiService)
│   ├── view_models/        # State management (e.g., AssetViewModel)
│   ├── views/              # UI screens and widgets
│
└── ...
```

---

## Key Components

- **app.dart**: Configures the MaterialApp, theme, localization, and sets the home screen.
- **main.dart**: Entry point, runs the app with the selected environment.
- **app_flow.dart**: Sets up dependency injection and provides the root widget tree.
- **runner.dart**: Initializes DI and runs the app.
- **app/config/**: Contains environment and build type definitions.
- **app/data/**: Contains API client (`DioApi`), interceptors, and service result wrappers.
- **app/design/**: Contains design utilities like `SizeConfig` for responsive UI.
- **app/di/**: Dependency injection setup and app scope definitions.
- **app/env/**: Environment variables and generated files (e.g., `.g.dart`).
- **app/error/**: Error handling and network exception mapping.
- **app/theme/**: Theme definitions, including text styles and colors.
- **app/utils/**: Utility extensions and helpers.
- **home/**: Feature module for asset listing, including models, services, view models, and views.

---

## How It Works

- **Dependency Injection** is set up in `app_flow.dart` and `runner.dart` using custom scopes.
- **Networking** is handled by `DioApi` with interceptors for API keys and error handling.
- **State Management** uses `Provider` and `ChangeNotifier` (see `AssetViewModel`).
- **UI** is built with responsive design (`SizeConfig`) and theming (`theme.dart`).
- **Localization** is enabled in `app.dart`.
- **Error Handling** is centralized in `app/error/network_exceptions.dart`.

---

## Getting Started

1. **Install dependencies:**
   ```sh
   flutter pub get
   ```

2. **Set up environment variables** in `lib/app/env/`.

3. **Run the app:**
   ```sh
   flutter run
   ```

---

## Notes

- Generated files (`*.g.dart`, `*.freezed.dart`) are ignored by git.
- The app is structured for scalability and testability.
- For more details, see comments in the source code.

---