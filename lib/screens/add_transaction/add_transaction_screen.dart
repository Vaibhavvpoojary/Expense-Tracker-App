import 'package:flutter/material.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String transactionType = "Expense";

  String selectedCategory = "Food";

  DateTime selectedDate = DateTime.now();

  final List<String> categories = [
    "Food",
    "Travel",
    "Grocery",
    "Home",
    "Education",
    "Bills",
    "Entertainment",
    "Health",
    "Shopping",
    "Salary",
    "Others",
  ];

  @override
  void dispose() {
    amountController.dispose();
    titleController.dispose();
    notesController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Add Transaction",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Transaction Type",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                Expanded(
                  child: RadioListTile(
                    value: "Expense",
                    groupValue: transactionType,
                    title: const Text("Expense"),
                    onChanged: (value) {
                      setState(() {
                        transactionType = value!;
                      });
                    },
                  ),
                ),

                Expanded(
                  child: RadioListTile(
                    value: "Income",
                    groupValue: transactionType,
                    title: const Text("Income"),
                    onChanged: (value) {
                      setState(() {
                        transactionType = value!;
                      });
                    },
                  ),
                ),

              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                prefixIcon: const Icon(Icons.currency_rupee),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                prefixIcon: const Icon(Icons.title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 20),

            InkWell(
              onTap: pickDate,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [

                    const Icon(Icons.calendar_today),

                    const SizedBox(width: 12),

                    Text(
                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: notesController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Notes (Optional)",
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2E7D32),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Transaction Saved Successfully"),
                    ),
                  );

                  Navigator.pop(context);
                },
                child: const Text(
                  "SAVE TRANSACTION",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}