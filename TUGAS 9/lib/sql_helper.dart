import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<sql.Database> db() async {
    return sql.openDatabase("catatan.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<void> createTable(sql.Database database) async {
    await database.execute("""
      CREATE TABLE catatan(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        judul TEXT,
        deskripsi TEXT
      )
      """);
  }

  static Future<int> tambahCatatan(String judul, String deskripsi) async {
    final db = await SQLHelper.db();
    final data = {'judul': judul, 'deskripsi': deskripsi};
    return await db.insert("catatan", data);
  }

  static Future<int> hapusCatatan(int id) async {
    final db = await SQLHelper.db();
    return await db.delete("catatan", where: "id = ?", whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getCatatan() async {
    final db = await SQLHelper.db();
    return db.query("catatan");
  }

  static Future<int> ubahCatatan(int id, String judul, String deskripsi) async {
    final db = await SQLHelper.db();
    final data = {'judul': judul, 'deskripsi': deskripsi};
    return await db.update('catatan', data, where: "id = ?", whereArgs: [id]);
  }
}
