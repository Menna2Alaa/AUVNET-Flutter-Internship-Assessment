# E-Commerce Flutter App

A modern and visually appealing **e-commerce mobile app** built with **Flutter** and **Firebase**. This app includes a complete onboarding flow, user authentication, and a dynamic home screen showing services and popular restaurants. Built with clean architecture and reusable custom widgets.

---

## Features

- **Splash Screen**  
  Displays the app logo for 3 seconds, then checks if onboarding is complete.

- **Onboarding Flow**  
  - Three onboarding screens.  
  - Appears only the **first time** the app is opened.  
  - Navigation based on user progress, tracked with **Hive**.

- **Authentication**  
  - Firebase-based **sign-up** and **login** with validation.  
  - Password confirmation and error handling.  
  - After signup/login, users are navigated to the home screen.

- **Home Screen**  
  - Personalized greeting with user name and address.  
  - Components include:
    - Services 
    - Popular restaurants 
    - QR code prompt
    - Promotional banner
    - Shortcut tiles 

- **Custom Widgets & UI**  
  - Reusable components: `CustomeText`, `CustomeButton`, `CustomeTextFormField`.  
  - Consistent design and styling across the app.

---

##Tech Stack

| Tool / Package        | Purpose                          |
|-----------------------|----------------------------------|
| **Flutter**           | UI development                   |
| **Firebase Auth**     | User authentication              |
| **Hive**              | Local storage (onboarding flag, user data) |
| **BLoC**              | State management (`HomeBloc`)    |
| **ModalProgressHUD**  | Loading indicators for forms     |

---

##Project Structure

```plaintext
lib/
│
├── Blocs/                  # BLoC logic for Home screen
├── helper/                 # Hive service, utilities
├── models/                 # Data models (User, Restaurant, Service)
├── views/                  # App screens (login, signup, onboarding, home)
├── widgets/                # Custom reusable widgets
├── firebase_options.dart   # Firebase config (auto-generated)
├── main.dart               # App entry point


 ```
## Project Setup & Installation Guide

Follow these steps to get the project running locally:

### 1. Clone the Repository

git clone [(https://github.com/Menna2Alaa/AUVNET-Flutter-Internship-Assessment.git)]
cd e_commerce_app
```
```
### 2. Install Flutter Packages

```bash

flutter pub get
```


### 3. Set Up Firebase

* Go to [Firebase Console](https://console.firebase.google.com/)
* Create a new project (if not created)
* Add an Android app:

* Use the package name from `android/app/src/main/AndroidManifest.xml`
* Download `google-services.json`
* Place it in `android/app/`

**For iOS :**

* Add an iOS app to Firebase
* Download `GoogleService-Info.plist`
* Place it in `ios/Runner/`

### 4. Initialize Hive (Local Storage)

Hive is used to track onboarding completion. Make sure Hive is initialized before runApp:

```dart
await Hive.initFlutter();
await Hive.openBox('settings');
```

### 5. Run the App

```bash
flutter run
```

To run on a specific device:

```bash
flutter devices
flutter run -d <device_id>
```

