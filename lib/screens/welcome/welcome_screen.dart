import 'package:flutter/material.dart';
import '../profile_setup/profile_setup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const SizedBox(height: 40),

              const Icon(
                Icons.account_balance_wallet_rounded,
                size: 90,
                color: Color(0xff2E7D32),
              ),

              const SizedBox(height: 25),

              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Expense Tracker",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff2E7D32),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Track your income, manage your expenses, and stay in control of your finances with ease.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Icon(
                    Icons.savings,
                    size: 100,
                    color: Color(0xff2E7D32),
                  ),
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2E7D32),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ProfileSetupScreen(),
    ),
  );
},
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}