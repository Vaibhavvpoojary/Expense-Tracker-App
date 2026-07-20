import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../categories/categories_screen.dart';


class MainScreen extends StatefulWidget {

  const MainScreen({super.key});


  @override
  State<MainScreen> createState() => _MainScreenState();

}


class _MainScreenState extends State<MainScreen> {


  int currentIndex = 0;


  final List<Widget> screens = [

    const HomeScreen(),

    const CategoriesScreen(),

    const Center(
      child: Text("Summary Screen"),
    ),

    const Center(
      child: Text("Profile Screen"),
    ),

  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: screens[currentIndex],


      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,


        selectedItemColor: const Color(0xff2E7D32),

        unselectedItemColor: Colors.grey,


        onTap: (index){

          setState(() {

            currentIndex = index;

          });

        },


        items: const [


          BottomNavigationBarItem(

            icon: Icon(Icons.home),

            label: "Home",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.grid_view),

            label: "Categories",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.bar_chart),

            label: "Summary",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.person),

            label: "Profile",

          ),


        ],


      ),

    );

  }

}