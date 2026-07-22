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
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(
      dbPath,
      "expense_tracker.db",
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

    Future<void> _onCreate(
    Database db,
    int version,
  ) async {

    // ==========================
    // Profile Table
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
    // Categories Table
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
    // Transactions Table
    // ==========================

    await db.execute('''
      CREATE TABLE transactions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        amount REAL NOT NULL,
        type TEXT NOT NULL,
        category_id INTEGER NOT NULL,
        date TEXT NOT NULL,
        note TEXT,
        FOREIGN KEY(category_id)
        REFERENCES categories(id)
      )
    ''');

    // ==========================
    // Budget Table
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

    Future<void> insertDefaultCategories(Database db) async {

    final categories = [

      {
        "name": "Food",
        "icon": Icons.restaurant.codePoint,
      },

      {
        "name": "Travel",
        "icon": Icons.directions_car.codePoint,
      },

      {
        "name": "Grocery",
        "icon": Icons.local_grocery_store.codePoint,
      },

      {
        "name": "Home",
        "icon": Icons.home.codePoint,
      },

      {
        "name": "Education",
        "icon": Icons.school.codePoint,
      },

      {
        "name": "Bills",
        "icon": Icons.receipt_long.codePoint,
      },

      {
        "name": "Entertainment",
        "icon": Icons.movie.codePoint,
      },

      {
        "name": "Health",
        "icon": Icons.local_hospital.codePoint,
      },

      {
        "name": "Shopping",
        "icon": Icons.shopping_bag.codePoint,
      },

      {
        "name": "Salary",
        "icon": Icons.account_balance_wallet.codePoint,
      },

      {
        "name": "Others",
        "icon": Icons.category.codePoint,
      },

    ];

    for (final category in categories) {

      await db.insert(
        'categories',
        category,
      );

    }
  }

  // ==========================
// PROFILE CRUD
// ==========================

// Insert Profile
Future<int> insertProfile(ProfileModel profile) async {
  final db = await database;

  return await db.insert(
    'profile',
    profile.toMap(),
  );
}

// Get Profile
Future<ProfileModel?> getProfile() async {
  final db = await database;

  final result = await db.query(
    'profile',
    limit: 1,
  );

  if (result.isNotEmpty) {
    return ProfileModel.fromMap(result.first);
  }

  return null;
}

// Update Profile
Future<int> updateProfile(ProfileModel profile) async {
  final db = await database;

  return await db.update(
    'profile',
    profile.toMap(),
    where: 'id = ?',
    whereArgs: [profile.id],
  );
}

// ==========================
// CATEGORY CRUD
// ==========================

// Insert Category
Future<int> insertCategory(
  String name,
  int icon,
) async {

  final db = await database;

  return await db.insert(
    'categories',
    {
      'name': name,
      'icon': icon,
    },
  );
}

// Get All Categories
Future<List<Map<String, dynamic>>> getCategories() async {

  final db = await database;

  return await db.query(
    'categories',
    orderBy: 'name ASC',
  );
}

// Update Category
Future<int> updateCategory(
  int id,
  String name,
  int icon,
) async {

  final db = await database;

  return await db.update(
    'categories',
    {
      'name': name,
      'icon': icon,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
}

// Delete Category
Future<int> deleteCategory(int id) async {

  final db = await database;

  return await db.delete(
    'categories',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// ==========================
// TRANSACTION CRUD
// ==========================

// Insert Transaction
Future<int> insertTransaction(
  TransactionModel transaction,
) async {

  final db = await database;

  return await db.insert(
    'transactions',
    transaction.toMap(),
  );
}

// Get All Transactions
Future<List<TransactionModel>> getTransactions() async {

  final db = await database;

  final result = await db.query(
    'transactions',
    orderBy: 'date DESC',
  );

  return result
      .map((e) => TransactionModel.fromMap(e))
      .toList();
}

// Update Transaction
Future<int> updateTransaction(
  TransactionModel transaction,
) async {

  final db = await database;

  return await db.update(
    'transactions',
    transaction.toMap(),
    where: 'id = ?',
    whereArgs: [transaction.id],
  );
}

// Delete Transaction
Future<int> deleteTransaction(int id) async {

  final db = await database;

  return await db.delete(
    'transactions',
    where: 'id = ?',
    whereArgs: [id],
  );
}

// Search Transactions
Future<List<TransactionModel>> searchTransactions(
  String keyword,
) async {

  final db = await database;

  final result = await db.query(
    'transactions',
    where: 'title LIKE ? OR note LIKE ?',
    whereArgs: [
      '%$keyword%',
      '%$keyword%',
    ],
    orderBy: 'date DESC',
  );

  return result
      .map((e) => TransactionModel.fromMap(e))
      .toList();
}

}
