# 💜 Flutter Persisted Counter App

A feature-complete Flutter counter application that demonstrates key mobile development concepts, including screen navigation, theme management, and local data persistence.

## ✨ Features

* **Splash Screen (`splash_screen.dart`):** A custom splash screen displaying the app name and a loading indicator for 3 seconds before navigating to the main screen.
* **Local Persistence:** Uses the `shared_preferences` package to save the counter value, ensuring the count persists even after the app is closed and reopened.
* **Dynamic UI & Animation:** The counter display area (`AnimatedContainer`) dynamically changes color, border, and shadow to provide **visual feedback** for:
    * **Zero/Neutral** (Blue)
    * **Increment/Success** (Green)
    * **Decrement/Warning** (Orange)
* **Custom Control Chips:** Uses `ActionChip` widgets for the Increment, Decrement, and Reset buttons with dynamic styling and logic (e.g., the Decrement button is disabled when the count is 0).
* **Custom Theming:** Defines a primary color (`#673AB7` - Deep Purple) in `main.dart` for a consistent theme across the application.

## 🚀 Getting Started

These instructions will help you set up and run a copy of the project on your local machine.

### Prerequisites

* **Flutter SDK:** Ensure you have the latest stable Flutter SDK installed and configured.
* **IDE:** An IDE like Visual Studio Code or Android Studio with the Flutter and Dart plugins.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/arsh-malik1704/Flutter-Counter-App.git]
    cd Flutter-Counter-App
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the app:**
    ```bash
    flutter run
    ```
    (Ensure you have an active emulator or a physical device connected.)
    
## 🛠️ Built With

* [Flutter](https://flutter.dev/) - UI Toolkit
* [Dart](https://dart.dev/) - Language
* [`shared_preferences`](https://pub.dev/packages/shared_preferences) - Used for local data persistence.

## ✍️ Author

* **[AREESHA MALIK]**e

The key files in t
