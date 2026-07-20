import 'package:flutter/material.dart';


class CategoryDetailsScreen extends StatelessWidget {


  final String categoryName;


  const CategoryDetailsScreen({

    super.key,

    required this.categoryName,

  });



  final List<Map<String,dynamic>> transactions = const [


    {
      "date":"20 July 2026",
      "title":"Lunch",
      "amount":"₹250",
    },


    {
      "date":"20 July 2026",
      "title":"Dinner",
      "amount":"₹180",
    },


    {
      "date":"19 July 2026",
      "title":"Breakfast",
      "amount":"₹100",
    },


    {
      "date":"19 July 2026",
      "title":"Snacks",
      "amount":"₹80",
    },


  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor: const Color(0xffF5F7FA),



      appBar: AppBar(


        backgroundColor: Colors.transparent,

        elevation:0,


        title: Text(

          categoryName,

          style: const TextStyle(

            color:Colors.black,

            fontWeight:FontWeight.bold,

          ),

        ),


        centerTitle:true,


      ),



      body:Padding(


        padding:const EdgeInsets.all(18),



        child:Column(


          children:[



            // Search bar


            TextField(


              decoration:InputDecoration(


                hintText:"Search by date",


                prefixIcon:const Icon(Icons.search),


                filled:true,


                fillColor:Colors.white,


                border:OutlineInputBorder(


                  borderRadius:BorderRadius.circular(15),


                  borderSide:BorderSide.none,


                ),


              ),


            ),



            const SizedBox(height:20),




            Expanded(


              child:ListView.builder(


                itemCount:transactions.length,


                itemBuilder:(context,index){


                  return Card(


                    elevation:2,


                    margin:const EdgeInsets.only(bottom:12),


                    shape:RoundedRectangleBorder(


                      borderRadius:BorderRadius.circular(15),


                    ),



                    child:ListTile(


                      leading:Container(


                        padding:const EdgeInsets.all(12),


                        decoration:BoxDecoration(


                          color:const Color(0xffE8F5E9),


                          borderRadius:BorderRadius.circular(12),


                        ),


                        child:const Icon(

                          Icons.money_off,

                          color:Color(0xff2E7D32),

                        ),


                      ),



                      title:Text(

                        transactions[index]["title"],

                        style:const TextStyle(

                          fontWeight:FontWeight.bold,

                        ),

                      ),



                      subtitle:Text(

                        transactions[index]["date"],

                      ),




                      trailing:Text(


                        transactions[index]["amount"],


                        style:const TextStyle(


                          color:Colors.red,


                          fontWeight:FontWeight.bold,


                          fontSize:16,


                        ),


                      ),



                    ),


                  );


                },


              ),


            ),




            Container(


              width:double.infinity,


              padding:const EdgeInsets.all(18),


              decoration:BoxDecoration(


                color:const Color(0xff2E7D32),


                borderRadius:BorderRadius.circular(18),


              ),


              child:const Text(


                "Total Food Expense : ₹610",


                textAlign:TextAlign.center,


                style:TextStyle(


                  color:Colors.white,

                  fontSize:18,

                  fontWeight:FontWeight.bold,

                ),

              ),


            )



          ],


        ),


      ),


    );


  }


}