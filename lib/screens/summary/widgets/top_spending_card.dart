import 'package:flutter/material.dart';

class TopSpendingCard extends StatelessWidget {
  const TopSpendingCard({super.key});

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
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Top Spending",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          _buildItem(
            icon: Icons.restaurant,
            color: Colors.orange,
            category: "Food",
            amount: "₹6,420",
          ),

          const Divider(),

          _buildItem(
            icon: Icons.directions_bus,
            color: Colors.blue,
            category: "Travel",
            amount: "₹2,350",
          ),

          const Divider(),

          _buildItem(
            icon: Icons.shopping_cart,
            color: Colors.green,
            category: "Grocery",
            amount: "₹1,920",
          ),

          const SizedBox(height: 15),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // We'll connect this later
              },
              child: const Text(
                "View All Categories →",
                style: TextStyle(
                  color: Color(0xff2E7D32),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required Color color,
    required String category,
    required String amount,
  }) {
    return Row(
      children: [

        CircleAvatar(
          radius: 20,
          backgroundColor: color.withOpacity(.12),
          child: Icon(
            icon,
            color: color,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Text(
            category,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),

        Text(
          amount,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

      ],
    );
  }
}