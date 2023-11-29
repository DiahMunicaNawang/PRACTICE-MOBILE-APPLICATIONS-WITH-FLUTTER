class Foto {
  late int id; // Variabel untuk menyimpan ID dari foto
  late String judul; // Variabel untuk menyimpan judul dari foto
  late String deskripsi; // Variabel untuk menyimpan deskripsi dari foto
  late String gambar; // Variabel untuk menyimpan URL gambar dari foto


  Foto({
    required this.id, // Parameter wajib untuk menginisialisasi variabel ID
    required this.judul, // Parameter wajib untuk menginisialisasi variabel judul
    required this.deskripsi, // Parameter wajib untuk menginisialisasi variabel deskripsi
    required this.gambar, // Parameter wajib untuk menginisialisasi variabel gambar
  });
}
