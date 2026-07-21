import 'package:flutter/material.dart';
import '../../edit_profile/edit_profile_screen.dart';
import '../../categories/manage_categories_screen.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          const Text(
            "Account",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),


          const SizedBox(height: 15),



          // Edit Profile

          ListTile(

            leading: const Icon(
              Icons.edit,
              color: Color(0xff2E7D32),
            ),


            title: const Text(
              "Edit Profile",
            ),


            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),



            onTap: () {


              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) => const EditProfileScreen(),

                ),

              );


            },


          ),



          const Divider(),



          // Manage Categories

          ListTile(

            leading: const Icon(

              Icons.category,

              color: Color(0xff2E7D32),

            ),



            title: const Text(

              "Manage Categories",

            ),



            trailing: const Icon(

              Icons.arrow_forward_ios,

              size: 16,

            ),



            onTap: () {


              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) =>  ManageCategoriesScreen(),

                ),

              );


            },


          ),


        ],

      ),

    );

  }

}