import 'package:flutter/material.dart';

class IncomeExpenseCard extends StatelessWidget {
  final String income;
  final String expense;
  final String selectedPeriod;
  final ValueChanged<String?> onChanged;

  const IncomeExpenseCard({
    super.key,
    required this.income,
    required this.expense,
    required this.selectedPeriod,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Overview",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              DropdownButton<String>(
                value: selectedPeriod,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(
                    value: "Today",
                    child: Text("Today"),
                  ),
                  DropdownMenuItem(
                    value: "Week",
                    child: Text("Week"),
                  ),
                  DropdownMenuItem(
                    value: "Month",
                    child: Text("Month"),
                  ),
                  DropdownMenuItem(
                    value: "Year",
                    child: Text("Year"),
                  ),
                ],
                onChanged: onChanged,
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child:  Column(
                    children: [

                      Icon(
                        Icons.arrow_downward,
                        color: Colors.green,
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Income",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
  income,
  style: const TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [

                      Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                      ),

                      SizedBox(height: 8),

                      Text(
                        "Expense",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),

                      SizedBox(height: 6),

                      Text(
  expense,
  style: const TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}