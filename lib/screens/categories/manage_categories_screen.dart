import 'package:flutter/material.dart';
import 'widgets/add_category_dialog.dart';
import 'widgets/edit_category_dialog.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({super.key});

  @override
  State<ManageCategoriesScreen> createState() =>
      _ManageCategoriesScreenState();
}


class _ManageCategoriesScreenState
    extends State<ManageCategoriesScreen> {


  final List<Map<String, dynamic>> categories = [

    {
      "name": "Food",
      "icon": Icons.restaurant,
    },

    {
      "name": "Transport",
      "icon": Icons.directions_car,
    },

    {
      "name": "Shopping",
      "icon": Icons.shopping_bag,
    },

    {
      "name": "Entertainment",
      "icon": Icons.movie,
    },

    {
      "name": "Health",
      "icon": Icons.local_hospital,
    },

    {
      "name": "Bills",
      "icon": Icons.receipt_long,
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

          "Manage Categories",

          style: TextStyle(

            color: Colors.black,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),



      body: Padding(

        padding: const EdgeInsets.all(18),

        child: Column(

          children: [


            SizedBox(

              width: double.infinity,

              height: 50,


              child: ElevatedButton.icon(

                style: ElevatedButton.styleFrom(

                  backgroundColor: const Color(0xff2E7D32),

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(15),

                  ),

                ),


                icon: const Icon(

                  Icons.add,

                  color: Colors.white,

                ),


                label: const Text(

                  "Add Category",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 16,

                  ),

                ),



                onPressed: () async {


                  final result = await showDialog(

                    context: context,

                    builder: (context) {

                      return const AddCategoryDialog();

                    },

                  );



                  if(result != null){

                    setState(() {

                      categories.add(result);

                    });

                  }


                },

              ),

            ),



            const SizedBox(height: 20),




            Expanded(

              child: ListView.builder(

                itemCount: categories.length,


                itemBuilder: (context,index){


                  return Container(

                    margin: const EdgeInsets.only(
                      bottom: 12,
                    ),


                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(18),

                    ),



                    child: ListTile(


                      leading: CircleAvatar(

                        backgroundColor:
                            const Color(0xffE8F5E9),


                        child: Icon(

                          categories[index]["icon"],

                          color:
                              const Color(0xff2E7D32),

                        ),

                      ),




                      title: Text(

                        categories[index]["name"],

                        style: const TextStyle(

                          fontWeight: FontWeight.w600,

                        ),

                      ),





                      trailing: Row(

                        mainAxisSize: MainAxisSize.min,


                        children: [



                          // EDIT BUTTON

                          IconButton(

                            icon: const Icon(

                              Icons.edit,

                              color: Colors.blue,

                            ),



                            onPressed: () async {


                              final result =
                                  await showDialog(


                                context: context,


                                builder: (context){


                                  return EditCategoryDialog(


                                    categoryName:
                                        categories[index]["name"],


                                    categoryIcon:
                                        categories[index]["icon"],


                                  );


                                },

                              );



                              if(result != null){


                                setState(() {


                                  categories[index] = result;


                                });


                              }


                            },


                          ),




                          // DELETE BUTTON

                          IconButton(


                            icon: const Icon(

                              Icons.delete,

                              color: Colors.red,

                            ),



                            onPressed: () {


                              setState(() {


                                categories.removeAt(index);


                              });



                              ScaffoldMessenger.of(context)
                                  .showSnackBar(


                                const SnackBar(

                                  content: Text(

                                    "Category deleted successfully!",

                                  ),


                                  backgroundColor:
                                      Colors.red,


                                  behavior:
                                      SnackBarBehavior.floating,


                                ),


                              );


                            },


                          ),


                        ],

                      ),


                    ),


                  );


                },


              ),

            ),


          ],

        ),

      ),

    );

  }

}