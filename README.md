# Contact App

## 📌 Overview
This is a contact management application built using **Flutter**, with **GetX** as a mini-framework for state management and navigation. Firebase is used as the backend for **user authentication (Firebase Auth)** and **contact data storage (Cloud Firestore)**.

## 🛠 Technologies Used
- **Flutter** as the main framework
- **GetX** for state management and routing
- **Firebase Authentication** for user authentication
- **Cloud Firestore** for contact data storage

## 🔑 How the Application Works

### **1. User Registration**
- Users create an account using an email and password.
- Firebase Authentication stores authentication data and generates a **UID** for the user.
- This UID is used to create a document in the **users** collection, storing user information such as **name**.

### **2. Login and Contact Management**
- When a user logs in, the app displays the list of contacts stored in the **contacts subcollection** within the user's document.
- Each user can only view and manage their own contacts based on their UID.
- Users can **add, edit, and delete** their contacts:
  - **Adding a contact:** A new contact entry is added to the **contacts** subcollection in Firestore.
  - **Editing a contact:** An existing contact's data is updated in Firestore.
  - **Deleting a contact:** The contact is removed based on its ID in Firestore.

### **3. Profile and Account Settings**
- Users can **update their account name** in the Firestore user document.
- To **change the password**, the application will:
  - Verify if the old password matches the user’s input.
  - If correct, update the old password with the new one.

### **4. Forgot Password**
- If users forget their password, they can use the **Forgot Password** feature.
- Firebase will send a password reset email to the registered email address.

## 🏩 Firebase Firestore Database Schema
```plaintext
users (Collection)
│── {uid} (Document)
│   ├── name: String
│   ├── email: String
│   ├── contacts (SubCollection)
│       ├── {contactId} (Document)
│       │   ├── name: String
│       │   ├── phone: String
```

## 🚀 How to Run the Project
1. **Clone the Repository**
   ```sh
   git clone https://github.com/username/contact-app.git
   cd contact-app
   ```
2. **Install Dependencies**
   ```sh
   flutter pub get
   ```
3. **Configure Firebase**
   - Add the `google-services.json` file to the `android/app/` folder.
   - Add the `GoogleService-Info.plist` file to the `ios/Runner/` folder.
4. **Run the Application**
   ```sh
   flutter run
   ```

## 👤 Demo App
[Click here to view the demo](https://drive.google.com/file/d/10GkV9FXl1kmQjJ9DWPQWC5P4G_gvqiLj/view?usp=sharing) (Replace with actual link)

## 📂 Folder Structure
```plaintext
lib/
│── data/                 # Data layer (Model, Repository, API service)
│   ├── model/            # Data models
│── modules/              # Application modules (Login, Home, Contacts, etc.)
│   ├── page_name/        # Module for each page
│       ├── view/         # UI components
│       ├── binding/      # Bindings to connect controllers and views
│       ├── controller/   # Business logic
│── routes/               # Navigation configuration using GetX
│── utils/                # Utility functions (Validators, Helpers, etc.)
│── main.dart             # Application entry point
```

## 📌 Conclusion
This application uses **Firebase Authentication** for user authentication and **Cloud Firestore** to store user contacts using a **subcollection** structure. With **GetX**, state management and navigation become more lightweight and efficient. Key features include **CRUD operations for contacts, profile updates, password changes, and password reset functionality**.

