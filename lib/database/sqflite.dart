// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class SqlDb {
//   static Database? _db;

//   Future<Database?> get db async {
//     if (_db == null) {
//       _db = await intialDb();
//       return _db;
//     } else {
//       return _db;
//     }
//   }

//   intialDb() async {
//     String databasepath = await getDatabasesPath();
//     String path = join(databasepath, 'users.db');
//     Database mydb = await openDatabase(path,
//         onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
//     return mydb;
//   }

//   _onUpgrade(Database db, int oldversion, int newversion) {
//     print("onUpgrade =====================================");
//   }

//   _onCreate(Database db, int version) async {
//     await db.execute('''
//   CREATE TABLE "user" (
//     "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
//     "email" TEXT NOT NULL
//     "password" TEXT NOT NULL
//   )
//  ''');
//     print(" onCreate =====================================");
//   }

//   Future<List<Map<String, dynamic>>> readData() async {
//     Database? mydb = await db;
//     String sql = 'SELECT * FROM user';
//     List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
//     return response;
//   }

//   Future<int> insertData(String email, String password) async {
//     Database? mydb = await db;
//     String sql = 'INSERT INTO user (email, password) VALUES (?, ?)';
//     List<dynamic> arguments = [email, password];
//     int response = await mydb!.rawInsert(sql, arguments);
//     return response;
//   }

//   Future<int> updateData(int id, String email, String password) async {
//     Database? mydb = await db;
//     String sql = 'UPDATE user SET email = ?, password = ? WHERE id = ?';
//     List<dynamic> arguments = [email, password, id];
//     int response = await mydb!.rawUpdate(sql, arguments);
//     return response;
//   }

//   Future<int> deleteData(int id) async {
//     Database? mydb = await db;
//     String sql = 'DELETE FROM user WHERE id = ?';
//     List<dynamic> arguments = [id];
//     int response = await mydb!.rawDelete(sql, arguments);
//     return response;
//   }

//   Future<List<Map<String, dynamic>>> searchUser1(
//       String email, String password) async {
//     Database? mydb = await db;
//     String sql = 'SELECT * FROM user WHERE email = ? AND password = ?';
//     List<dynamic> arguments = [email, password];
//     List<Map<String, dynamic>> response = await mydb!.rawQuery(sql, arguments);
//     return response;
//   }

//   Future<bool> searchUser(String email, String password) async {
//     Database? mydb = await db;
//     String sql = 'SELECT COUNT(*) FROM user WHERE email = ? AND password = ?';
//     List<dynamic> arguments = [email, password];
//     int count =
//         Sqflite.firstIntValue(await mydb!.rawQuery(sql, arguments)) ?? 0;
//     bool userExists = count > 0;
//     return userExists;
//   }

//   bool isPasswordValid(String password) {
//     RegExp passwordRegex = RegExp(
//         r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#\$%^&*()_+\-=[\]{};:\'\\|,.<>\/?]).{8,}$");
//     return passwordRegex.hasMatch(password);
//   }
// // SELECT
// // DELETE
// // UPDATE
// // INSERT
// }
