import 'package:flutter/material.dart';

class RecentTransactionCard extends StatelessWidget {
  const RecentTransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text("See All"),
              ),

            ],
          ),

          const SizedBox(height: 10),

          _transactionTile(
            icon: Icons.fastfood,
            iconColor: Colors.orange,
            title: "Food",
            subtitle: "Lunch",
            amount: "₹250",
            date: "Today",
          ),

          const Divider(),

          _transactionTile(
            icon: Icons.directions_bus,
            iconColor: Colors.blue,
            title: "Travel",
            subtitle: "Bus Ticket",
            amount: "₹450",
            date: "Yesterday",
          ),

          const Divider(),

          _transactionTile(
            icon: Icons.shopping_cart,
            iconColor: Colors.green,
            title: "Grocery",
            subtitle: "Super Market",
            amount: "₹1,200",
            date: "18 Jul",
          ),

        ],
      ),
    );
  }

  Widget _transactionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required String date,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,

      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.15),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),

      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(subtitle),

      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Text(
            amount,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            date,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),

        ],
      ),
    );
  }
}