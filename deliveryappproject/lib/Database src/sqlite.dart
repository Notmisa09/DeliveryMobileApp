import 'package:deliveryappproject/Model/Users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final databaseName = "users.db";
  String usersTable =
      "CREATE TABLE users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";

  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(usersTable);
    });
  }

  // Método para registrar un nuevo usuario
  Future<int> signup(Users user) async {
    final Database db = await initDB();
    try {
      return await db.insert('users', user.toMap());
    } catch (error) {
      // Manejo de errores si el nombre de usuario ya existe o algún otro error de inserción
      return Future.error('Usuario ya existe o error de inserción');
    }
  }

  // Método para iniciar sesión
  Future<bool> login(Users user) async {
    final Database db = await initDB();
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'usrName = ? AND usrPassword = ?',
      whereArgs: [user.usrName, user.usrPassword],
    );

    return result.isNotEmpty;
  }
}
