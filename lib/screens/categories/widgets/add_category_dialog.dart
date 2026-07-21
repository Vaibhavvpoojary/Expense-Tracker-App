import 'package:flutter/material.dart';


class AddCategoryDialog extends StatefulWidget {

  const AddCategoryDialog({super.key});


  @override
  State<AddCategoryDialog> createState() =>
      _AddCategoryDialogState();

}



class _AddCategoryDialogState
    extends State<AddCategoryDialog> {


  final TextEditingController categoryController =
      TextEditingController();


  IconData selectedIcon = Icons.category;



  final List<IconData> icons = [

    Icons.restaurant,
    Icons.directions_car,
    Icons.shopping_bag,
    Icons.movie,
    Icons.local_hospital,
    Icons.receipt_long,
    Icons.school,
    Icons.home,
    Icons.fitness_center,

  ];



  @override
  Widget build(BuildContext context) {


    return AlertDialog(

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20),

      ),



      title: const Text(

        "Add Category",

        style: TextStyle(

          fontWeight: FontWeight.bold,

        ),

      ),



      content: Column(

        mainAxisSize: MainAxisSize.min,


        children: [


          TextField(

            controller: categoryController,

            decoration: InputDecoration(

              labelText: "Category Name",

              border: OutlineInputBorder(

                borderRadius:
                    BorderRadius.circular(15),

              ),

            ),

          ),



          const SizedBox(height: 20),



          const Align(

            alignment: Alignment.centerLeft,

            child: Text(

              "Select Icon",

              style: TextStyle(

                fontWeight: FontWeight.w600,

              ),

            ),

          ),



          const SizedBox(height: 10),



          Wrap(

            spacing: 10,

            children: icons.map((icon){


              return GestureDetector(

                onTap: (){

                  setState(() {

                    selectedIcon = icon;

                  });

                },


                child: CircleAvatar(

                  backgroundColor:
                      selectedIcon == icon

                          ? const Color(0xff2E7D32)

                          : Colors.grey.shade200,


                  child: Icon(

                    icon,

                    color:

                    selectedIcon == icon

                        ? Colors.white

                        : Colors.black,

                  ),

                ),

              );


            }).toList(),

          ),


        ],

      ),



      actions: [


        TextButton(

          onPressed: (){

            Navigator.pop(context);

          },

          child: const Text(

            "Cancel",

          ),

        ),



        ElevatedButton(

          style: ElevatedButton.styleFrom(

            backgroundColor:
                const Color(0xff2E7D32),

          ),


          onPressed: (){


            if(categoryController.text.isNotEmpty){


              Navigator.pop(

                context,

                {

                  "name":
                      categoryController.text,

                  "icon":
                      selectedIcon,

                },

              );


            }


          },


          child: const Text(

            "Save",

            style: TextStyle(

              color: Colors.white,

            ),

          ),

        ),


      ],

    );

  }

}