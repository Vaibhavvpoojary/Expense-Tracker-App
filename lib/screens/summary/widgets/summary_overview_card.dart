import 'package:flutter/material.dart';

class SummaryOverviewCard extends StatelessWidget {
  final String income;
  final String expense;
  final String savings;

  const SummaryOverviewCard({
    super.key,
    required this.income,
    required this.expense,
    required this.savings,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "This Month",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 18),

        Row(
          children: [

            Expanded(
              child: _buildCard(
                title: "Income",
                amount: income,
                icon: Icons.arrow_downward,
                color: Colors.green,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _buildCard(
                title: "Expense",
                amount: expense,
                icon: Icons.arrow_upward,
                color: Colors.red,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _buildCard(
                title: "Savings",
                amount: savings,
                icon: Icons.savings,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(.12),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            amount,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}