import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [

    {
      "name": "Food",
      "icon": Icons.restaurant,
    },

    {
      "name": "Travel",
      "icon": Icons.directions_bus,
    },

    {
      "name": "Grocery",
      "icon": Icons.shopping_cart,
    },

    {
      "name": "Home",
      "icon": Icons.home,
    },

    {
      "name": "Education",
      "icon": Icons.menu_book,
    },

    {
      "name": "Bills",
      "icon": Icons.lightbulb,
    },

    {
      "name": "Entertainment",
      "icon": Icons.movie,
    },

    {
      "name": "Health",
      "icon": Icons.favorite,
    },

    {
      "name": "Shopping",
      "icon": Icons.shopping_bag,
    },

    {
      "name": "Others",
      "icon": Icons.category,
    },

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FA),

      appBar: AppBar(

        backgroundColor: Colors.transparent,

        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Categories",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),


      body: Padding(

        padding: const EdgeInsets.all(18),

        child: GridView.builder(

          itemCount: categories.length,

          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

            crossAxisCount: 2,

            crossAxisSpacing: 16,

            mainAxisSpacing: 16,

            childAspectRatio: 1.1,

          ),


          itemBuilder: (context,index){

            return InkWell(

              onTap: (){

                // Later we will open category details page

              },


              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [

                    BoxShadow(

                      color: Colors.grey.withOpacity(0.15),

                      blurRadius: 8,

                      offset: const Offset(0,4),

                    ),

                  ],

                ),


                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Container(

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(

                        color: const Color(0xffE8F5E9),

                        shape: BoxShape.circle,

                      ),

                      child: Icon(

                        categories[index]["icon"],

                        size: 32,

                        color: const Color(0xff2E7D32),

                      ),

                    ),


                    const SizedBox(height: 12),


                    Text(

                      categories[index]["name"],

                      style: const TextStyle(

                        fontSize: 16,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ],

                ),

              ),

            );

          },

        ),

      ),

    );

  }

}