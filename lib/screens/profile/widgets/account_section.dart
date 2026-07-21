import 'package:flutter/material.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xffE8F5E9),
              child: Icon(
                Icons.edit,
                color: Color(0xff2E7D32),
              ),
            ),
            title: const Text("Edit Profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              // Navigate to Edit Profile Screen
            },
          ),

          const Divider(height: 1),

          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xffE8F5E9),
              child: Icon(
                Icons.category,
                color: Color(0xff2E7D32),
              ),
            ),
            title: const Text("Manage Categories"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: () {
              // Navigate to Manage Categories Screen
            },
          ),
        ],
      ),
    );
  }
}