import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_11/sqllite_db.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget { //mendefinisikan class MyApp turunan dari StatelessWidget
  const MyApp({Key? key}) : super(key: key); // konstruktor untuk keas myApp

  @override
  Widget build(BuildContext context) { // Mendefinisikan fungsi build untuk mengembalikan widget
    return MaterialApp(
      title: 'List Gambar Diah Munica N', // judu apikasi 
      home: const MyHomePage(title: 'List Gambar Diah Munica N'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController judulController = TextEditingController(); // Mendeklarasikan controller untuk judul
  TextEditingController deskripsiController = TextEditingController(); // Mendeklarasikan controller untuk deskripsi
  TextEditingController gambarController = TextEditingController(); // Mendeklarasikan controller untuk gambar

  List<Map<String, dynamic>> catatan = []; // Mendeklarasikan list kosong untuk catatan
  Map<String, dynamic>? catatanDihapus; // Mendeklarasikan variabel untuk menyimpan catatan yang dihapus

  void refreshCatatan() async { // Fungsi untuk memperbarui daftar catatan dari database
    final data = await SQLHelper.getCatatan(); // Mendapatkan data catatan dari database
    setState(() { // Memperbarui state dari widget
      catatan = data; // Menyimpan data yang diperoleh ke dalam list catatan
    });
  }

  @override
  void initState() { // Metode yang dipanggil saat state pertama kali dibuat
    refreshCatatan(); // Memanggil fungsi untuk memperbarui catatan
    super.initState();
  }

  Future<void> _ambilGambar() async { // Fungsi untuk mengambil gambar dari galeri
    final picker = ImagePicker(); // Objek ImagePicker
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Mengambil gambar dari galeri

    if (pickedFile != null) {
      setState(() {
        gambarController.text = pickedFile.path; // Mengatur path gambar yang dipilih ke dalam controller gambar
      });
    }
  }

// Fungsi-fungsi untuk menambah, menghapus, mengubah, dan menampilkan catatan serta tampilan aplikasi (ine 62-153)
  Future<void> tambahCatatan(
      String judul, String deskripsi, String gambar) async {
    await SQLHelper.tambahCatatan(judul, deskripsi, gambar);
    refreshCatatan();
  }

  Future<void> hapusCatatan(int id) async {
    catatanDihapus = catatan.firstWhere((item) => item['id'] == id);
    await SQLHelper.hapusCatatan(id);

    refreshCatatan();
  }

  Future<void> ubahCatatan(
      int id, String judul, String deskripsi, String gambar) async {
    await SQLHelper.ubahCatatan(id, judul, deskripsi, gambar);
    refreshCatatan();
  }

  void modalForm(int? id) async {
    if (id != null) {
      final dataCatatan = catatan.firstWhere((item) => item['id'] == id);

      judulController.text = dataCatatan['judul'];
      deskripsiController.text = dataCatatan['deskripsi'];
      gambarController.text = dataCatatan['gambar'];
    }
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: 800,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: judulController,
                decoration: const InputDecoration(hintText: "masukkan judul"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: deskripsiController,
                decoration:
                    const InputDecoration(hintText: "masukkan deskripsi"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: _ambilGambar,
                icon: Icon(
                  Icons.image,
                  color: Colors.white, // Warna ikon
                ),
                label: Text(
                  "Pilih Gambar",
                  style: TextStyle(
                    color: Colors.white, // Warna teks
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Warna latar belakang
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await tambahCatatan(judulController.text,
                        deskripsiController.text, gambarController.text);
                    print("tambah");
                  } else {
                    print("update");
                    await ubahCatatan(id, judulController.text,
                        deskripsiController.text, gambarController.text);
                  }
                  judulController.text = '';
                  deskripsiController.text = '';
                  gambarController.text = '';
                  Navigator.pop(context);
                  refreshCatatan();
                },
                child: Text(id == null ? 'Tambah' : 'Ubah'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder( // Membuat daftar menggunakan ListView.builder
        itemCount: catatan.length, // Jumlah item dalam daftar adalah panjang dari list catatan
        itemBuilder: (context, index) => Card( // Membuat kartu untuk setiap item dalam daftar
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.file(
                  File(catatan[index]['gambar']),
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            catatan[index]['judul'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(catatan[index]['deskripsi']),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0), // Atur padding ke bawah ikon
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => modalForm(catatan[index]['id']),
                            icon: const Icon(Icons.edit),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              hapusCatatan(catatan[index]['id']);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          modalForm(null);
        },
        tooltip: 'Tambah Catatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
