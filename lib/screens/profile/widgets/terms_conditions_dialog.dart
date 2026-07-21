import 'package:flutter/material.dart';

class TermsConditionsDialog extends StatelessWidget {

  const TermsConditionsDialog({super.key});


  @override
  Widget build(BuildContext context) {


    return AlertDialog(

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20),

      ),



      title: const Text(

        "Terms & Conditions",

        style: TextStyle(

          fontWeight: FontWeight.bold,

        ),

      ),




      content: const SingleChildScrollView(

        child: Text(

          """
Welcome to the Expense Tracker application.

By using this application, you agree to the following terms and conditions:

1. This application is intended for personal expense management purposes.

2. Users are responsible for entering accurate expense and income information.

3. The application does not provide financial, investment, or professional advice.

4. Users should maintain backups of important financial information.

5. Features and functionality may be updated or modified to improve user experience.

6. Misuse of the application or unauthorized access attempts are prohibited.

7. Continued usage of the application means you accept these terms and conditions.

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