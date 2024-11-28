import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseauthapp/pages/signin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User? user;

  const HomePage({Key? key, this.user}) : super(key: key);

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Color.fromARGB(204, 219, 192, 217),
              Color.fromARGB(204, 219, 192, 217),
              Color.fromARGB(204, 219, 192, 217),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Background Icon
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.1, // Transparency of the icon
                  child: Icon(
                    Icons.account_circle, // Example icon
                    size: 300, // Adjust the size
                    color: Colors.white, // Icon color
                  ),
                ),
              ),
            ),
            // Main Content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  const Text(
                    " KhushAmDeed :)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user?.email ?? "No Email Provided",
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadowColor: Colors.black,
                      elevation: 10,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () => _logout(context),
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
