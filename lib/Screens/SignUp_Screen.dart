import 'package:flutter/material.dart';
import 'package:streamline/Screens/Movie_Home_Screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  double passwordStrength = 0;
  String strengthText = 'Weak';

  void checkPasswordStrength(String password) {
    setState(() {
      if (password.isEmpty) {
        passwordStrength = 0;
        strengthText = 'Weak';
      } else if (password.length < 6) {
        passwordStrength = 0.3;
        strengthText = 'Weak';
      } else if (password.length < 10) {
        passwordStrength = 0.6;
        strengthText = 'Medium';
      } else {
        passwordStrength = 1.0;
        strengthText = 'Strong';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // 👈 close the screen
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: ListView(
            children: [
              const Text("Email",style: TextStyle(fontSize: 19),),
              const SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle:
                  const TextStyle(color: Color(0xFF9090BE)), // #9090BE
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text("Password",style: TextStyle(fontSize: 19)),
              const SizedBox(height: 5),
              TextField(
                controller: passwordController,
                obscureText: true,
                onChanged: checkPasswordStrength,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle:
                  const TextStyle(color: Color(0xFF9090BE)), // #9090BE
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                "Password Strength",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 8, // thicker bar
                child: LinearProgressIndicator(
                  value: passwordStrength,
                  color: Color(0xFF4747EB),
                  backgroundColor: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                strengthText,
                style: TextStyle(
                  fontSize: 14,
                  color: passwordStrength < 0.6
                      ? Colors.red
                      : passwordStrength < 1.0
                      ? Colors.orange
                      : Colors.green,
                ),
              ),

              const SizedBox(height: 16),
              const Text("Confirm Password",style: TextStyle(fontSize: 19)),
              const SizedBox(height: 5),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm your password',
                  hintStyle:
                  const TextStyle(color: Color(0xFF9090BE)), // #9090BE
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4747EB), // #4747EB
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MovieHomeScreen()));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to login screen
                  },
                  child: const Text(
                    "Already have an account? Sign in",
                    style: TextStyle(color: Color(0xFF9090BE)), // #9090BE
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
