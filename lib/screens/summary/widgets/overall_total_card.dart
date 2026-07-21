import 'package:flutter/material.dart';

class OverallTotalCard extends StatelessWidget {
  final String total;

  const OverallTotalCard({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff2E7D32),
            Color(0xff4CAF50),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(.25),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [

          const Icon(
            Icons.account_balance_wallet,
            color: Colors.white,
            size: 38,
          ),

          const SizedBox(height: 12),

          const Text(
            "Overall Expense",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 17,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            total,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}