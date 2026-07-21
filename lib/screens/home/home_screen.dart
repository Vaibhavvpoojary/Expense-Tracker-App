import 'package:flutter/material.dart';

import 'widgets/balance_card.dart';
import 'widgets/income_expense_card.dart';
import 'widgets/budget_card.dart';
import 'widgets/suggestion_card.dart';
import 'widgets/recent_transaction_card.dart';
import 'widgets/home_bottom_navbar.dart';

import '../add_transaction/add_transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPeriod = "Today";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Vaibhav",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            BalanceCard(
              balance: "₹24,550",
            ),

            const SizedBox(height: 20),

            IncomeExpenseCard(
              income: "₹40,000",
              expense: "₹850",
              selectedPeriod: selectedPeriod,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedPeriod = value;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            const BudgetCard(
              remainingAmount: "₹14,150",
              progress: 0.68,
            ),

            const SizedBox(height: 20),

            const SuggestionCard(
              title: "Smart Suggestion",
              message:
                  "You spent ₹320 less than yesterday.\nGreat job! Keep maintaining your spending habits.",
            ),

            const SizedBox(height: 20),

            const RecentTransactionCard(),

            const SizedBox(height: 90),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff2E7D32),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddTransactionScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      bottomNavigationBar:  HomeButtonNavBar(
        currentIndex: 0,
      ),
    );
  }
}