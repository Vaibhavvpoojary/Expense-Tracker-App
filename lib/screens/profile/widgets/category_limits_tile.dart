import 'package:flutter/material.dart';

class CategoryLimitsTile extends StatefulWidget {
  const CategoryLimitsTile({super.key});

  @override
  State<CategoryLimitsTile> createState() => _CategoryLimitsTileState();
}

class _CategoryLimitsTileState extends State<CategoryLimitsTile> {
  final List<Map<String, dynamic>> categories = [
    {
      "name": "Food",
      "icon": Icons.restaurant,
      "limit": 5000.0,
    },
    {
      "name": "Transport",
      "icon": Icons.directions_car,
      "limit": 3000.0,
    },
    {
      "name": "Shopping",
      "icon": Icons.shopping_bag,
      "limit": 4000.0,
    },
    {
      "name": "Entertainment",
      "icon": Icons.movie,
      "limit": 2500.0,
    },
    {
      "name": "Bills",
      "icon": Icons.receipt_long,
      "limit": 6000.0,
    },
    {
      "name": "Health",
      "icon": Icons.local_hospital,
      "limit": 3500.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ExpansionTile(
        leading: const Icon(
          Icons.category,
          color: Color(0xff2E7D32),
        ),
        title: const Text(
          "Category Limits",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        childrenPadding: const EdgeInsets.all(18),
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      category["icon"],
                      color: const Color(0xff2E7D32),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        category["name"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "₹${(category["limit"] as double).toInt()}",
                      style: const TextStyle(
                        color: Color(0xff2E7D32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: category["limit"],
                  min: 1000,
                  max: 20000,
                  activeColor: const Color(0xff2E7D32),
                  onChanged: (value) {
                    setState(() {
                      category["limit"] = value;
                    });
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}