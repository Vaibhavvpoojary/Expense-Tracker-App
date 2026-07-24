import 'package:flutter/material.dart';

import 'widgets/balance_card.dart';
import 'widgets/income_expense_card.dart';
import 'widgets/budget_card.dart';
import 'widgets/suggestion_card.dart';
import 'widgets/recent_transaction_card.dart';
import 'widgets/home_bottom_navbar.dart';

import '../add_transaction/add_transaction_screen.dart';
import '../../database/database_helper.dart';
import '../../models/transaction_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  String selectedPeriod = "Today";


  double totalIncome = 0;
  double totalExpense = 0;
  double currentBalance = 0;


  bool isLoading = true;


  String userName = "User";
  List<TransactionModel> recentTransactions = [];



  @override
  void initState() {
    super.initState();

    loadDashboard();
  }




  Future<void> loadDashboard() async {

    try {

      setState(() {
        isLoading = true;
      });


      final income =
          await DatabaseHelper.instance.getTotalIncome();


      final expense =
          await DatabaseHelper.instance.getTotalExpense();


      final balance =
          await DatabaseHelper.instance.getCurrentBalance();


      final profile =
          await DatabaseHelper.instance.getProfile();


      final transactions =
          await DatabaseHelper.instance.getTransactions();



      if(!mounted) return;


      setState(() {

        totalIncome = income;

        totalExpense = expense;

        currentBalance = balance;

        if(profile != null){
          userName = profile.name;
        }

        recentTransactions = transactions.take(3).toList();

        isLoading = false;

      });



    } catch(e){

      debugPrint(
        "Dashboard Error : $e"
      );


      if(!mounted) return;


      setState(() {

        isLoading = false;

      });


      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            "Error loading dashboard"
          ),
        ),
      );

    }

  }





  @override
  Widget build(BuildContext context) {


    if(isLoading){

      return const Scaffold(

        body: Center(

          child: CircularProgressIndicator(),

        ),

      );

    }



    return Scaffold(


      backgroundColor: const Color(0xffF5F7FA),



      appBar: AppBar(

        backgroundColor: Colors.transparent,

        elevation: 0,


        title: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,


          children: [


            Text(
              "Good Morning 👋",

              style: TextStyle(

                fontSize: 14,

                color: Colors.black54,

              ),

            ),



            SizedBox(height: 3),



            Text(

              userName,

              style: TextStyle(

                fontSize: 24,

                fontWeight: FontWeight.bold,

              ),

            ),


          ],

        ),

      ),





      body: SingleChildScrollView(

        padding: const EdgeInsets.all(18),


        child: Column(

          children: [



            BalanceCard(

              balance:
              "₹${currentBalance.toStringAsFixed(2)}",

            ),



            const SizedBox(height:20),




            IncomeExpenseCard(

              income:
              "₹${totalIncome.toStringAsFixed(2)}",


              expense:
              "₹${totalExpense.toStringAsFixed(2)}",


              selectedPeriod:
              selectedPeriod,


              onChanged:(value){


                if(value!=null){

                  setState((){

                    selectedPeriod=value;

                  });

                }


              },


            ),




            const SizedBox(height:20),




            BudgetCard(

              remainingAmount:
              "₹${currentBalance.toStringAsFixed(2)}",


              progress:0.5,

            ),





            const SizedBox(height:20),




            const SuggestionCard(

              title:
              "Smart Suggestion",


              message:
              "Track your expenses regularly to improve your savings.",

            ),





            const SizedBox(height:20),




            RecentTransactionCard(
              transactions: recentTransactions,
            ),





            const SizedBox(height:90),



          ],


        ),

      ),





      floatingActionButton: FloatingActionButton(


        backgroundColor:
        const Color(0xff2E7D32),



        onPressed:() async{


          await Navigator.push(

            context,

            MaterialPageRoute(

              builder:(_)=>
              const AddTransactionScreen(),

            ),

          );



          // refresh dashboard after adding transaction

          loadDashboard();



        },



        child: const Icon(

          Icons.add,

          color: Colors.white,

        ),

      ),




      bottomNavigationBar:

      const HomeButtonNavBar(

        currentIndex:0,

      ),


    );

  }

}