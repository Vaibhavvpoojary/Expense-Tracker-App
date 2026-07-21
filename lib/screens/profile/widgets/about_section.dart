import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                "About",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(
              Icons.info_outline,
              color: Color(0xff2E7D32),
            ),
            title: const Text("Version"),
            subtitle: const Text("1.0.0"),
          ),

          const Divider(height: 1),

          ListTile(
            leading: const Icon(
              Icons.privacy_tip_outlined,
              color: Color(0xff2E7D32),
            ),
            title: const Text("Privacy Policy"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onTap: () {
              // Open Privacy Policy
            },
          ),

          const Divider(height: 1),

          ListTile(
            leading: const Icon(
              Icons.description_outlined,
              color: Color(0xff2E7D32),
            ),
            title: const Text("Terms & Conditions"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            onTap: () {
              // Open Terms & Conditions
            },
          ),
        ],
      ),
    );
  }
}