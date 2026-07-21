import 'package:flutter/material.dart';

class BudgetLimitsTile extends StatefulWidget {
  const BudgetLimitsTile({super.key});

  @override
  State<BudgetLimitsTile> createState() => _BudgetLimitsTileState();
}

class _BudgetLimitsTileState extends State<BudgetLimitsTile> {
  double weekLimit = 5000;
  double monthLimit = 20000;
  double yearLimit = 240000;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ExpansionTile(
        leading: const Icon(
          Icons.account_balance_wallet,
          color: Color(0xff2E7D32),
        ),
        title: const Text(
          "Budget Limits",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        children: [

          // Week
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Week Limit : ₹${weekLimit.toInt()}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Slider(
            value: weekLimit,
            min: 1000,
            max: 20000,
            activeColor: const Color(0xff2E7D32),
            onChanged: (value) {
              setState(() {
                weekLimit = value;
              });
            },
          ),

          const SizedBox(height: 10),

          // Month
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Month Limit : ₹${monthLimit.toInt()}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Slider(
            value: monthLimit,
            min: 5000,
            max: 100000,
            activeColor: const Color(0xff2E7D32),
            onChanged: (value) {
              setState(() {
                monthLimit = value;
              });
            },
          ),

          const SizedBox(height: 10),

          // Year
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Year Limit : ₹${yearLimit.toInt()}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Slider(
            value: yearLimit,
            min: 50000,
            max: 1000000,
            activeColor: const Color(0xff2E7D32),
            onChanged: (value) {
              setState(() {
                yearLimit = value;
              });
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}