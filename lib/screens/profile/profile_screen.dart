import 'package:flutter/material.dart';
import 'widgets/profile_header.dart';
import 'widgets/income_balance_card.dart';
import 'widgets/budget_limits_tile.dart';
import 'widgets/category_limits_tile.dart';
import 'widgets/account_section.dart';
import 'widgets/about_section.dart';
import '../home/widgets/home_bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children:  [

            ProfileHeader(
              name: "Vaibhav Poojary",
              occupation: "Student",
            ),

            SizedBox(height: 20),

            IncomeBalanceCard(
              income: "₹40,000",
              balance: "₹24,550",
            ),

            SizedBox(height: 20),

            BudgetLimitsTile(),

            SizedBox(height: 20),

            CategoryLimitsTile(),

            SizedBox(height: 20),

            AccountSection(),

            SizedBox(height: 20),

            AboutSection(),

            SizedBox(height: 90),
          ],
        ),
      ),

      bottomNavigationBar: const HomeButtonNavBar(
        currentIndex: 3,
      ),
    );
  }
}