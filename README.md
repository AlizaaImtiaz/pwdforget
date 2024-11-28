1. Project Implementation
a. Login Screen
UI Implementation:
Create two TextFormField widgets for Email and Password inputs.
Add validation logic for:
Email format using regex.
Non-empty password.
Implement "Forgot Password" and "Signup" navigation using Navigator.push or named routes.
Logic:
Authenticate user credentials using Firebase Authentication's signInWithEmailAndPassword() method.
Display appropriate error messages using try-catch for handling exceptions.
On successful login, navigate to the Home Page.
b. Signup Screen
UI Implementation:
Add four TextFormField widgets for Name, Email, Password, and Confirm Password.
Include a "Signup" button and a "Login" link for navigation.
Validation:
Ensure all fields are non-empty.
Validate email format and password strength (minimum 8 characters, alphanumeric).
Check if Password and Confirm Password match.
Logic:
Use Firebase Authentication's createUserWithEmailAndPassword() method to register the user.
On success, display a confirmation and redirect to the Login screen.
c. Home Page
UI Implementation:
Display a welcome message with the user’s name or email using session data from local storage (e.g., Shared Preferences).
Add a "Logout" button.
Logic:
Clear user session data on logout and redirect to the Login Screen.
2. Firebase Backend Setup
a. Create a Firebase Project
Visit Firebase Console.
Click Add Project and follow the on-screen instructions:
Provide a project name.
Disable Google Analytics (optional).
b. Add Your Flutter App
In the Firebase Console, navigate to Project Settings > Your Apps.
Select the Flutter icon and follow these steps:
Register the app by providing your app's package name (found in android/app/src/main/AndroidManifest.xml).
Download the google-services.json file for Android and place it in android/app/.
(For iOS) Download GoogleService-Info.plist and place it in ios/Runner/.
c. Enable Firebase Authentication
In the Firebase Console, go to the Authentication section.
Click Get Started and enable the Email/Password sign-in method.
d. Add Firebase SDK to Flutter
Open pubspec.yaml and add the following dependencies:
yaml
Copy code
dependencies:
  firebase_auth: latest_version
  firebase_core: latest_version
Run:
bash
Copy code
flutter pub get
e. Initialize Firebase in Flutter
Open your project’s main.dart file.
Initialize Firebase in the main() function:
dart
Copy code
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
3. Firebase Integration in Flutter
a. User Signup
Use firebase_auth for creating a new user:
dart
Copy code
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signupUser(String email, String password) async {
  try {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Successful signup logic
  } catch (e) {
    print("Error: $e");
  }
}
b. User Login
Authenticate users with email and password:
dart
Copy code
Future<void> loginUser(String email, String password) async {
  try {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // Successful login logic
  } catch (e) {
    print("Error: $e");
  }
}
c. Logout
Implement logout functionality:
dart
Copy code
Future<void> logoutUser() async {
  await _auth.signOut();
  // Redirect to login screen
}
d. Display User Information
Fetch the logged-in user’s data:
dart
Copy code
User? user = _auth.currentUser;
if (user != null) {
  print("User email: ${user.email}");
}
4. Error Handling
Handle common exceptions such as:
Invalid email: Display "Invalid email format."
Weak password: Display "Password must be at least 6 characters."
User not found: Display "No user found with this email."
Wrong password: Display "Incorrect password."
5. Best Practices
Secure User Data: Do not store sensitive data like passwords locally.
Input Validation: Ensure strong password policies and valid email formats.
Error Messages: Show user-friendly error messages for smoother UX.
