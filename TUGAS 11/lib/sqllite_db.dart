import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<sql.Database> db() async { // Fungsi untuk mendapatkan koneksi database
    return sql.openDatabase("catatan.db", version: 1, // Buka atau buat database "catatan.db" versi 1
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<void> createTable(sql.Database database) async { //ungsi untuk membuat tabel
    await database.execute(""" 
      CREATE TABLE catatan( 
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        judul TEXT,
        deskripsi TEXT,
        gambar TEXT
      )
      """);// Perintah untuk membuat table database 
  }

  static Future<int> tambahCatatan(String judul, String deskripsi, String gambar) async { //Menambah catatan baru ke dalam database (CREATE)
    final db = await SQLHelper.db(); // mendapatkan koneksi ke databse
    final data = {'judul': judul, 'deskripsi': deskripsi, 'gambar': gambar}; //D ata yang akan dimasukkan
    return await db.insert("catatan", data); // Masukkan data ke dalam tabel 'catatan'
  }

  static Future<void> hapusCatatan(int id) async { // Hapus catatan berdasarkan ID (DELETE)
    final db = await SQLHelper.db(); // mendapatkan koneksi ke databse
    await db.delete("catatan", where: "id=$id"); // hapus data berdasarkan id
  }

  static Future<List<Map<String, dynamic>>> getCatatan() async { // mendapatkan daftar catatan dari database (READ)
    final db = await SQLHelper.db(); // mendapatkan koneksi ke databse
    return db.query("catatan"); // mengambil semua data dari tabel 
  }

  static Future<int> ubahCatatan(int id, String judul, String deskripsi, String gambar) async { // Ubah catatan berdasarkan ID (UPDATE)
    final db = await SQLHelper.db(); // mendapatkan koneksi ke databse
    final data = {'judul': judul, 'deskripsi': deskripsi, 'gambar': gambar}; // data yang akan di ubah
    return await db.update('catatan', data, where: "id = $id"); // mengubah data dalam tabel berdasrkan id
  }
}