import 'package:flutter/material.dart';

class SearchFilterCard extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String?> onChanged;

  const SearchFilterCard({
    super.key,
    required this.selectedFilter,
    required this.onChanged,
  });

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
            "Search & Filter",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          TextField(
            decoration: InputDecoration(
              hintText: "Search transaction...",
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xff2E7D32),
              ),
              filled: true,
              fillColor: const Color(0xffF5F7FA),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xff2E7D32),
                  width: 2,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Filter By",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<String>(
            value: selectedFilter,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF5F7FA),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(
                  color: Color(0xff2E7D32),
                  width: 2,
                ),
              ),
            ),

            items: const [

              DropdownMenuItem(
                value: "Today",
                child: Text("Today"),
              ),

              DropdownMenuItem(
                value: "Yesterday",
                child: Text("Yesterday"),
              ),

              DropdownMenuItem(
                value: "Last 7 Days",
                child: Text("Last 7 Days"),
              ),

              DropdownMenuItem(
                value: "This Month",
                child: Text("This Month"),
              ),

              DropdownMenuItem(
                value: "Last Month",
                child: Text("Last Month"),
              ),

              DropdownMenuItem(
                value: "This Year",
                child: Text("This Year"),
              ),

              DropdownMenuItem(
                value: "Custom Date",
                child: Text("Custom Date"),
              ),
            ],

            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}