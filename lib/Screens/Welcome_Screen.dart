import 'package:flutter/material.dart';
import 'package:streamline/Screens/SignUp_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Movie Poster/Image
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/Welcome-Screen.jpg', // Replace with your image
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Bottom Section
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFF111014), // Dark background
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Your Ultimate Movie Companion',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const Spacer(), // pushes the buttons to the bottom

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Log In Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2B2B30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
