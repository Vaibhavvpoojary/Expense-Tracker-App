import 'package:flutter/material.dart';

import 'widgets/summary_overview_card.dart';
import 'widgets/top_spending_card.dart';
import 'widgets/search_filter_card.dart';
import 'widgets/transaction_history_card.dart';
import 'widgets/overall_total_card.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String selectedFilter = "This Month";

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

            SummaryOverviewCard(
              income: "₹40,000",
              expense: "₹15,420",
              savings: "₹24,580",
            ),

            const SizedBox(height: 20),

            const TopSpendingCard(),

            const SizedBox(height: 20),

            SearchFilterCard(
              selectedFilter: selectedFilter,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedFilter = value;
                  });
                }
              },
            ),

            const SizedBox(height: 20),

            const TransactionHistoryCard(),

            const SizedBox(height: 20),

            const OverallTotalCard(
              total: "₹15,420",
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}