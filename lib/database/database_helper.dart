import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/profile_model.dart';
import '../models/transaction_model.dart';


class DatabaseHelper {

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance =
      DatabaseHelper._privateConstructor();


  static Database? _database;



  Future<Database> get database async {

    if(_database != null){
      return _database!;
    }


    _database = await _initDatabase();

    return _database!;

  }





  Future<Database> _initDatabase() async {


    final dbPath =
        await getDatabasesPath();


    final path =
        join(
          dbPath,
          "expense_tracker.db",
        );



    return await openDatabase(

      path,

      version: 2,

      onCreate: _onCreate,

    );

  }





  Future<void> _onCreate(
      Database db,
      int version,
      ) async {



    // ==========================
    // PROFILE TABLE
    // ==========================


    await db.execute('''
    
    CREATE TABLE profile(
    
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    occupation TEXT NOT NULL,
    income REAL NOT NULL,
    currency TEXT NOT NULL
    
    )
    
    ''');





    // ==========================
    // CATEGORY TABLE
    // ==========================


    await db.execute('''
    
    CREATE TABLE categories(
    
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    icon INTEGER NOT NULL,
    limit_amount REAL DEFAULT 0
    
    )
    
    ''');






    // ==========================
    // TRANSACTION TABLE
    // ==========================


    await db.execute('''
    
    CREATE TABLE transactions(
    
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    amount REAL NOT NULL,
    type TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    date TEXT NOT NULL,
    note TEXT
    
    )
    
    ''');






    // ==========================
    // BUDGET TABLE
    // ==========================


    await db.execute('''
    
    CREATE TABLE budget(
    
    id INTEGER PRIMARY KEY,
    weekly_limit REAL DEFAULT 0,
    monthly_limit REAL DEFAULT 0,
    yearly_limit REAL DEFAULT 0
    
    )
    
    ''');




    await insertDefaultCategories(db);

  }






  // ==========================
  // DEFAULT CATEGORIES
  // ==========================


  Future<void> insertDefaultCategories(Database db) async {


    final categories = [

      {
        "name":"Food",
        "icon":Icons.restaurant.codePoint
      },

      {
        "name":"Travel",
        "icon":Icons.directions_car.codePoint
      },

      {
        "name":"Grocery",
        "icon":Icons.local_grocery_store.codePoint
      },


      {
        "name":"Home",
        "icon":Icons.home.codePoint
      },


      {
        "name":"Education",
        "icon":Icons.school.codePoint
      },


      {
        "name":"Bills",
        "icon":Icons.receipt_long.codePoint
      },


      {
        "name":"Entertainment",
        "icon":Icons.movie.codePoint
      },


      {
        "name":"Health",
        "icon":Icons.local_hospital.codePoint
      },


      {
        "name":"Shopping",
        "icon":Icons.shopping_bag.codePoint
      },


      {
        "name":"Salary",
        "icon":Icons.account_balance_wallet.codePoint
      },


      {
        "name":"Others",
        "icon":Icons.category.codePoint
      },

    ];



    for(final category in categories){

      await db.insert(
        "categories",
        category,
      );

    }


  }







  // ==========================
  // PROFILE CRUD
  // ==========================


  Future<int> insertProfile(ProfileModel profile) async {


    final db = await database;


    return await db.insert(
      "profile",
      profile.toMap(),
    );

  }




  Future<ProfileModel?> getProfile() async {


    final db = await database;


    final result =
        await db.query(
          "profile",
          limit:1,
        );



    if(result.isNotEmpty){

      return ProfileModel.fromMap(
          result.first
      );

    }


    return null;

  }





  Future<int> updateProfile(ProfileModel profile) async {


    final db = await database;


    return await db.update(

      "profile",

      profile.toMap(),

      where:"id=?",

      whereArgs:[
        profile.id
      ],

    );


  }









  // ==========================
  // TRANSACTION CRUD
  // ==========================



  Future<int> insertTransaction(
      TransactionModel transaction
      ) async {


    final db = await database;


    return await db.insert(

      "transactions",

      transaction.toMap(),

    );


  }






  Future<List<TransactionModel>> getTransactions() async {


    final db = await database;


    final result =
        await db.query(

          "transactions",

          orderBy:
          "date DESC",

        );



    return result
        .map(
            (e)=>
            TransactionModel.fromMap(e)
    )
        .toList();


  }







  Future<int> updateTransaction(
      TransactionModel transaction
      ) async {


    final db = await database;


    return await db.update(

      "transactions",

      transaction.toMap(),

      where:"id=?",

      whereArgs:[
        transaction.id
      ],

    );


  }







  Future<int> deleteTransaction(int id) async {


    final db = await database;


    return await db.delete(

      "transactions",

      where:"id=?",

      whereArgs:[
        id
      ],

    );


  }








  // ==========================
  // DASHBOARD CALCULATIONS
  // ==========================



  Future<double> getTotalIncome() async {


    final db = await database;


    final result =
        await db.rawQuery('''

        SELECT SUM(amount) as total

        FROM transactions

        WHERE type = ?

        ''',

          [
            "Income"
          ],

        );



    if(result.first["total"] == null){

      return 0;

    }



    return
      (result.first["total"] as num)
          .toDouble();


  }







  Future<double> getTotalExpense() async {


    final db = await database;


    final result =
        await db.rawQuery('''

        SELECT SUM(amount) as total

        FROM transactions

        WHERE type = ?

        ''',

          [
            "Expense"
          ],

        );



    if(result.first["total"] == null){

      return 0;

    }



    return
      (result.first["total"] as num)
          .toDouble();



  }








  Future<double> getCurrentBalance() async {


    final income =
    await getTotalIncome();


    final expense =
    await getTotalExpense();



    return income-expense;


  }








  // ==========================
  // DEBUG
  // ==========================


  Future<void> printTransactions() async {


    final db =
    await database;



    final result =
    await db.query(
        "transactions"
    );



    for(final item in result){

      debugPrint(
        "TRANSACTION DATA : $item",
      );

    }


  }




}