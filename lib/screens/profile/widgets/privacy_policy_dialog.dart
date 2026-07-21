import 'package:flutter/material.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),


      title: const Text(

        "Privacy Policy",

        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),

      ),



      content: const SingleChildScrollView(

        child: Text(

          """
Your privacy is important to us.

This expense tracker application is designed to help users manage their daily expenses efficiently.

We collect only the information required for providing app features such as profile management, expense tracking, categories, and budgeting.

Your financial information remains private and is stored securely on your device.

We do not sell, share, or transfer your personal information to third parties.

Users have complete control over their expense records and can manage their data anytime.

By using this application, you agree to the practices mentioned in this Privacy Policy.
""",

          style: TextStyle(
            fontSize: 14,
            height: 1.5,
          ),

        ),

      ),



      actions: [

        TextButton(

          onPressed: () {

            Navigator.pop(context);

          },


          child: const Text(

            "Close",

            style: TextStyle(
              color: Color(0xff2E7D32),
            ),

          ),

        ),

      ],

    );

  }

}