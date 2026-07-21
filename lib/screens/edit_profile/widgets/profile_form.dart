import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController nameController =
      TextEditingController(text: "Vaibhav Poojary");

  final TextEditingController occupationController =
      TextEditingController(text: "Student");

  final TextEditingController incomeController =
      TextEditingController(text: "40000");

  String selectedCurrency = "₹ Indian Rupee";

  final List<String> currencies = [
    "₹ Indian Rupee",
    "\$ US Dollar",
    "€ Euro",
    "£ British Pound",
    "¥ Japanese Yen",
  ];

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: Color(0xff2E7D32),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Full Name",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: nameController,
          decoration: inputDecoration("Enter your full name"),
        ),

        const SizedBox(height: 20),

        const Text(
          "Occupation",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: occupationController,
          decoration: inputDecoration("Enter your occupation"),
        ),

        const SizedBox(height: 20),

        const Text(
          "Monthly Income",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: incomeController,
          keyboardType: TextInputType.number,
          decoration: inputDecoration("Enter monthly income"),
        ),

        const SizedBox(height: 20),

        const Text(
          "Currency",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        DropdownButtonFormField<String>(
          value: selectedCurrency,
          decoration: inputDecoration("Select Currency"),
          items: currencies.map((currency) {
            return DropdownMenuItem(
              value: currency,
              child: Text(currency),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCurrency = value!;
            });
          },
        ),

        const SizedBox(height: 35),

        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2E7D32),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Profile updated successfully!"),
      backgroundColor: Color(0xff2E7D32),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    ),
  );

  Future.delayed(const Duration(seconds: 2), () {
    if (context.mounted) {
      Navigator.pop(context);
    }
  });
},
          ),
        ),
      ],
    );
  }
}