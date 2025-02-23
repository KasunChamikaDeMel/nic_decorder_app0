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
![Group 13](https://github.com/user-attachments/assets/25ff9f98-16ee-4a58-866b-119f900e04e8)
![Group 14](https://github.com/user-attachments/assets/540a4cec-730a-4974-b223-0747280d3cda)
![Group 15](https://github.com/user-attachments/assets/9247666f-f488-4e9b-bd71-cbf6b8b3356c)
![Group 16](https://github.com/user-attachments/assets/612fc16f-47d1-414c-bfdd-d252c8c91b9d)
![Group 12](https://github.com/user-attachments/assets/62ef39db-7065-4ee4-9240-a8f9c2a54df4)

Architecture diagram
![nic_decode-Page-2 drawio](https://github.com/user-attachments/assets/f3e92361-7d6e-4138-9c75-4a225c33b82c)


