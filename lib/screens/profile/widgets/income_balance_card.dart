import 'package:flutter/material.dart';

class IncomeBalanceCard extends StatelessWidget {
  final String income;
  final String balance;

  const IncomeBalanceCard({
    super.key,
    required this.income,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xff2E7D32),
                  size: 32,
                ),

                const SizedBox(height: 10),

                const Text(
                  "Monthly Income",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  income,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2E7D32),
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 1,
            height: 90,
            color: Colors.grey.shade300,
          ),

          Expanded(
            child: Column(
              children: [
                const Icon(
                  Icons.savings,
                  color: Colors.orange,
                  size: 32,
                ),

                const SizedBox(height: 10),

                const Text(
                  "Current Balance",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  balance,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}