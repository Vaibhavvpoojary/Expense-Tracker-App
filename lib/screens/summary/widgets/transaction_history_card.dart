import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Transaction History",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _buildDateSection(
            date: "20 Jul 2026",
            transactions: const [
              ["🍔", "Lunch", "₹250"],
              ["🚌", "Bus Fare", "₹100"],
              ["💡", "Electricity Bill", "₹200"],
            ],
            total: "₹550",
          ),

          const Divider(height: 35),

          _buildDateSection(
            date: "19 Jul 2026",
            transactions: const [
              ["🥞", "Breakfast", "₹150"],
              ["🛒", "Grocery", "₹500"],
            ],
            total: "₹650",
          ),
        ],
      ),
    );
  }

  Widget _buildDateSection({
    required String date,
    required List<List<String>> transactions,
    required String total,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          date,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),

        const SizedBox(height: 15),

        ...transactions.map(
          (transaction) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [

                Text(
                  transaction[0],
                  style: const TextStyle(fontSize: 22),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    transaction[1],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

                Text(
                  transaction[2],
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        const Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const Text(
              "Day Total",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              total,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

          ],
        ),
      ],
    );
  }
}