# nic_decorder_app0

A Flutter application that decodes Sri Lankan National Identity Card (NIC) numbers to extract personal details such as birth date, age, gender, and weekday of birth. Built with Flutter and GetX for state management, the app supports both old (9-digit + letter) and new (12-digit) NIC formats.

Key Features
=> NIC Validation: Auto-detects old/new NIC formats using regex
=> Date Conversion: Converts day-of-year to actual dates (handles leap years)
=> User-Friendly UI: Clean Material Design with error handling and navigation
=> Reactive Updates: Uses GetX for real-time state management
=> Result Display: Shows birth date, age, gender, weekday, and voting eligibility (old NIC)

Tech Stack
=> Flutter (UI Framework)
=> GetX (State Management & Navigation)
=> intl (Date Formatting)

Getting Started
=> Clone the repository
=> Run flutter pub get to install dependencies
=> Use sample NICs:
Old: 123456789v
New: 123456789123

Screenshots
![Group 16](https://github.com/user-attachments/assets/04f9dc15-1d0a-4404-b96a-db44f7254f7f)

