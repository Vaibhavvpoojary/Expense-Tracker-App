import 'package:flutter/material.dart';
import '../../../models/transaction_model.dart';

class RecentTransactionCard extends StatelessWidget {
  final List<TransactionModel> transactions;

  const RecentTransactionCard({
    super.key,
    this.transactions = const [],
  });

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

          if (transactions.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "No transactions yet",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            )
          else
            ...List.generate(transactions.length, (index) {
              final transaction = transactions[index];
              return Column(
                children: [
                  _transactionTile(
                    icon: _getCategoryIcon(transaction.categoryId),
                    iconColor: _getCategoryColor(transaction.categoryId),
                    title: transaction.title,
                    subtitle: transaction.note ?? "No note",
                    amount: "${transaction.type == 'Income' ? '+' : '-'}₹${transaction.amount.toStringAsFixed(2)}",
                    date: transaction.date,
                    isIncome: transaction.type == 'Income',
                  ),
                  if (index < transactions.length - 1) const Divider(),
                ],
              );
            }),

        ],
      ),
    );
  }

  IconData _getCategoryIcon(int categoryId) {
    // Map category IDs to icons (based on default categories order)
    final icons = [
      Icons.restaurant,      // Food
      Icons.directions_car,  // Travel
      Icons.local_grocery_store, // Grocery
      Icons.home,            // Home
      Icons.school,          // Education
      Icons.receipt_long,    // Bills
      Icons.movie,           // Entertainment
      Icons.local_hospital,  // Health
      Icons.shopping_bag,    // Shopping
      Icons.account_balance_wallet, // Salary
      Icons.category,        // Others
    ];
    return icons[categoryId % icons.length];
  }

  Color _getCategoryColor(int categoryId) {
    // Map category IDs to colors
    final colors = [
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.amber,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.lightGreen,
      Colors.grey,
    ];
    return colors[categoryId % colors.length];
  }

  Widget _transactionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String amount,
    required String date,
    bool isIncome = false,
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
            style: TextStyle(
              color: isIncome ? Colors.green : Colors.red,
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