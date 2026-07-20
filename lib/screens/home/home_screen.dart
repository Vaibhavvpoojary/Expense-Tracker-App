import 'package:flutter/material.dart';

import 'widgets/balance_card.dart';
import 'widgets/income_expense_card.dart';
import 'widgets/budget_card.dart';
import 'widgets/suggestion_card.dart';
import 'widgets/recent_transaction_card.dart';

import '../add_transaction/add_transaction_screen.dart';
import '../categories/categories_screen.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {


  String selectedPeriod = "Today";

  int selectedIndex = 0;



  Widget homeContent(){

    return SingleChildScrollView(

      padding: const EdgeInsets.all(18),

      child: Column(

        children: [


          BalanceCard(
            balance: "₹24,550",
          ),


          const SizedBox(height: 20),



          IncomeExpenseCard(

            income: "₹40,000",

            expense: "₹850",

            selectedPeriod: selectedPeriod,

            onChanged: (value){

              if(value != null){

                setState(() {

                  selectedPeriod = value;

                });

              }

            },

          ),



          const SizedBox(height:20),



          const BudgetCard(

            remainingAmount: "₹14,150",

            progress: 0.68,

          ),



          const SizedBox(height:20),



          const SuggestionCard(

            title: "Smart Suggestion",

            message:
            "You spent ₹320 less than yesterday.\nGreat job! Keep maintaining your spending habits.",

          ),



          const SizedBox(height:20),



          const RecentTransactionCard(),



          const SizedBox(height:90),


        ],

      ),

    );

  }




  Widget getBody(){


    switch(selectedIndex){


      case 1:

        return const CategoriesScreen();



      case 2:

        return const Center(

          child: Text(
            "Summary Screen",
            style: TextStyle(
              fontSize:22,
              fontWeight: FontWeight.bold,
            ),
          ),

        );



      case 3:

        return const Center(

          child: Text(
            "Profile Screen",
            style: TextStyle(
              fontSize:22,
              fontWeight: FontWeight.bold,
            ),
          ),

        );



      default:

        return homeContent();


    }


  }





  @override
  Widget build(BuildContext context) {


    return Scaffold(


      backgroundColor: const Color(0xffF5F7FA),



      appBar: AppBar(

        backgroundColor: Colors.transparent,

        elevation:0,

        centerTitle:false,


        title: const Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children:[


            Text(

              "Good Morning 👋",

              style: TextStyle(

                fontSize:14,

                color:Colors.black54,

              ),

            ),



            SizedBox(height:2),



            Text(

              "Vaibhav",

              style:TextStyle(

                fontSize:24,

                fontWeight:FontWeight.bold,

              ),

            ),


          ],

        ),

      ),




      body: getBody(),




      floatingActionButton: selectedIndex == 0

          ? FloatingActionButton(

              backgroundColor: const Color(0xff2E7D32),

              onPressed: (){


                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=> AddTransactionScreen(),

                  ),

                );


              },

              child: const Icon(

                Icons.add,

                color:Colors.white,

              ),

            )

          : null,






      bottomNavigationBar: BottomNavigationBar(


        currentIndex:selectedIndex,


        selectedItemColor:const Color(0xff2E7D32),


        unselectedItemColor:Colors.grey,



        onTap:(index){


          setState(() {


            selectedIndex=index;


          });


        },




        items:const[



          BottomNavigationBarItem(

            icon:Icon(Icons.home),

            label:"Home",

          ),




          BottomNavigationBarItem(

            icon:Icon(Icons.grid_view),

            label:"Categories",

          ),




          BottomNavigationBarItem(

            icon:Icon(Icons.bar_chart),

            label:"Summary",

          ),




          BottomNavigationBarItem(

            icon:Icon(Icons.person),

            label:"Profile",

          ),



        ],


      ),


    );

  }

}