import 'package:flutter/material.dart';

class EditCategoryDialog extends StatefulWidget {

  final String categoryName;
  final IconData categoryIcon;

  const EditCategoryDialog({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
  });


  @override
  State<EditCategoryDialog> createState() =>
      _EditCategoryDialogState();

}



class _EditCategoryDialogState
    extends State<EditCategoryDialog> {


  late TextEditingController categoryController;

  late IconData selectedIcon;


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
  void initState() {

    super.initState();

    categoryController =
        TextEditingController(
          text: widget.categoryName,
        );

    selectedIcon = widget.categoryIcon;

  }



  @override
  Widget build(BuildContext context) {


    return AlertDialog(

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20),

      ),


      title: const Text(

        "Edit Category",

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

            children: icons.map((icon) {


              return GestureDetector(

                onTap: () {

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

          onPressed: () {

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


          onPressed: () {


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

            "Update",

            style: TextStyle(

              color: Colors.white,

            ),

          ),

        ),


      ],

    );

  }

}