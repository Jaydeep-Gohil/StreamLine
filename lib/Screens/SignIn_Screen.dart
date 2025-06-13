import 'package:flutter/material.dart';
import 'package:streamline/Screens/Movie_Home_Screen.dart';
import 'package:streamline/Screens/SignUp_Screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC), // Light background
      appBar: AppBar(
        title: const Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // Help action
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            // Email Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(color: Color(0xFF9090BE)),
                filled: true,
                fillColor: const Color(0xFFEDEDF8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(color: Color(0xFF9090BE)),
                filled: true,
                fillColor: const Color(0xFFEDEDF8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Forgot password logic
                },
                child: Center(
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Color(0xFF4747EB)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Sign In Button
            SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4747EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MovieHomeScreen()));
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign Up Navigation
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                },
                child: const Text(
                  "New To Streamline? Sign Up",
                  style: TextStyle(color: Color(0xFF4747EB)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
