# Business Signup & Login Module

A Flutter application implementing business signup and login functionality with local storage.

## Architecture & Implementation

### Technology Stack
- **Framework:** Flutter
- **State Management:** BLoC/Cubit
- **Local Storage:** SharedPreferences
- **Architecture Pattern:** BLoC Pattern

### Key Features Implemented

#### 1. Signup Module
- Business Details Collection
  - Business Name
  - Business Email (with validation)
  - Business Address
  - Business Phone (10-digit validation)
  - Location (Dropdown selection)
  - Customer Count (Slider: 0-10,000)

- Contact Person Details
  - Full Name
  - Email Address
  - Phone Number
  - Designation
  - Date of Birth

- Form Validation
  - Email format validation
  - Phone number validation
  - Required field validation
  - Password strength validation

#### 2. Login Module
- Dual Login Options:
  - Email/Phone + Password
  - OTP based login (simulated)
- Session Management using SharedPreferences
- Form validation for all inputs

### Project Structure
```
lib/
├── models/
│   └── business_model.dart
├── screens/
│   ├── login_screen.dart
│   ├── signup.dart
│   └── home_screen.dart
├── services/
│   └── share_pref/
│       └── share_pref.dart
├── view_model/
│   └── auth/
│       ├── auth_cubit.dart
│       └── auth_state.dart
└── main.dart
```

### Dependencies
```yaml
dependencies:
  flutter_bloc: ^9.1.1
  bloc: ^9.0.0
  shared_preferences: ^2.5.3
```

## Getting Started

1. Clone the repository
2. Run `flutter pub get`
3. Run `flutter run`
