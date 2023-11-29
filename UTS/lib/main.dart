// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Katalog Bunga Diah Munica'),
//           backgroundColor: Color.fromARGB(255, 255, 79, 79),
//           leading: IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {
//               // Tambahkan aksi yang ingin Anda lakukan saat tombol home diklik di sini
//             },
//           ),
//         ),
//         body: FlowerListView(),
//       ),
//     );
//   }
// }

// class FlowerListView extends StatefulWidget {
//   @override
//   _FlowerListViewState createState() => _FlowerListViewState();
// }

// class _FlowerListViewState extends State<FlowerListView> {
//   final List<Map<String, dynamic>> bunga = [
//     {"nama": "Matahari", "harga": "65000", "gambar": "assets/images/1.jpg"},
//     {"nama": "Rose", "harga": "55000", "gambar": "assets/images/2.jpg"},
//     {"nama": "Dahlia", "harga": "20000", "gambar": "assets/images/3.jpg"},
//     {"nama": "Aster", "harga": "25000", "gambar": "assets/images/4.jpg"},
//     {"nama": "Krisan", "harga": "35000", "gambar": "assets/images/5.jpg"},
//     {"nama": "Lily", "harga": "40000", "gambar": "assets/images/6.jpg"},
//     {"nama": "Anggrek", "harga": "35000", "gambar": "assets/images/7.jpg"},
//     {"nama": "Jakaranda", "harga": "40000", "gambar": "assets/images/8.jpg"},
//     {"nama": "Mawar", "harga": "55000", "gambar": "assets/images/9.jpg"},
//     {"nama": "Melati", "harga": "50000", "gambar": "assets/images/10.jpg"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: ListView.builder(
//         itemCount: bunga.length,
//         itemBuilder: (context, index) {
//           final flower = bunga[index];

//           return Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.all(16.0),
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 3,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.15),
//                         SizedBox(height: 8.0),
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.15),
//                         SizedBox(height: 8.0),
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.15),
//                       ],
//                     ),
//                     SizedBox(width: 16.0),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Center(
//                             child: Text(
//                               flower['nama'],
//                               style: TextStyle(
//                                 fontSize: screenWidth * 0.04,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.star, color: Colors.yellow),
//                                 Icon(Icons.star, color: Colors.yellow),
//                                 Icon(Icons.star, color: Colors.yellow),
//                                 Icon(Icons.star, color: Colors.yellow),
//                               ],
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               'Harga: ${flower['harga']}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: screenHeight * 0.02),
//                           Center(
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 // Tambahkan aksi yang ingin Anda lakukan saat tombol diklik di sini
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 primary: Color.fromARGB(255, 0, 102, 255),
//                               ),
//                               child: Text(
//                                 "Submit",
//                                 style: TextStyle(
//                                   fontSize: screenWidth * 0.04,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       constraints: BoxConstraints(maxWidth: screenWidth * 0.3),
//                       child: Image.asset(flower['gambar'],
//                           height: screenHeight * 0.2),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Katalog Bunga Diah Munica'),
//           backgroundColor: Color.fromARGB(255, 255, 164, 60),
//           leading: IconButton(
//             icon: Icon(Icons.home),
//             onPressed: () {},
//           ),
//         ),
//         body: FlowerListView(),
//       ),
//     );
//   }
// }

// class FlowerListView extends StatefulWidget {
//   @override
//   _FlowerListViewState createState() => _FlowerListViewState();
// }

// class _FlowerListViewState extends State<FlowerListView> {
//   final List<Map<String, dynamic>> bunga = [
//     {"nama": "Matahari", "harga": "65000", "gambar": "assets/images/1.jpg"},
//     {"nama": "Rose", "harga": "55000", "gambar": "assets/images/2.jpg"},
//     {"nama": "Dahlia", "harga": "20000", "gambar": "assets/images/3.jpg"},
//     {"nama": "Aster", "harga": "25000", "gambar": "assets/images/4.jpg"},
//     {"nama": "Krisan", "harga": "35000", "gambar": "assets/images/5.jpg"},
//     {"nama": "Lily", "harga": "40000", "gambar": "assets/images/6.jpg"},
//     {"nama": "Anggrek", "harga": "35000", "gambar": "assets/images/7.jpg"},
//     {"nama": "Jakaranda", "harga": "40000", "gambar": "assets/images/8.jpg"},
//     {"nama": "Mawar", "harga": "55000", "gambar": "assets/images/9.jpg"},
//     {"nama": "Melati", "harga": "50000", "gambar": "assets/images/10.jpg"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: ListView.builder(
//         itemCount: bunga.length,
//         itemBuilder: (context, index) {
//           final flower = bunga[index];

//           return Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.all(16.0),
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 3,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.10),
//                         SizedBox(height: 5.0),
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.10),
//                         SizedBox(height: 5.0),
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.10),
//                       ],
//                     ),
//                     SizedBox(width: 0.30),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Center(
//                             child: Text(
//                               flower['nama'],
//                               style: TextStyle(
//                                 fontSize: screenWidth * 0.02,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(Icons.star, color: Colors.yellow),
//                                 Icon(Icons.star, color: Colors.yellow),
//                                 Icon(Icons.star, color: Colors.yellow),
//                                 Icon(Icons.star,
//                                     color: const Color.fromARGB(
//                                         255, 230, 229, 219)),
//                               ],
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               'Harga: ${flower['harga']}',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: screenHeight * 0.30),
//                           Center(
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors
//                                     .orange, // Mengatur warna latar belakang tombol menjadi oranye
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 0.03,
//                                     horizontal:
//                                         0.06), // Mengatur padding tombol
//                               ),
//                               child: Text(
//                                 "Submit",
//                                 style: TextStyle(
//                                   fontSize: screenWidth *
//                                       0.01, // Mengurangi ukuran font tombol
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       constraints: BoxConstraints(maxWidth: screenWidth * 0.3),
//                       child: Image.asset(flower['gambar'],
//                           height: screenHeight * 0.2),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart'; //digunakan untuk import package dart

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      home: Scaffold( 
        appBar: AppBar(
          title: Text('Katalog Bunga Diah Munica'), //untuk memberi judul
          backgroundColor: Color.fromARGB(255, 255, 164, 60), //mengatur warna agar berwarna orange
          leading: IconButton(
            icon: Icon(Icons.home), //mengatur agar ada icon home
            onPressed: () {},
          ),
        ),
        body: FlowerListView(), // Menampilkan daftar bunga menggunakan FlowerListView
      ),
    );
  }
}

class FlowerListView extends StatefulWidget { //membuat class listview
  @override
  _FlowerListViewState createState() => _FlowerListViewState();
}

class _FlowerListViewState extends State<FlowerListView> {
  final List<Map<String, dynamic>> bunga = [
    {"nama": "Matahari", "harga": "65000", "gambar": "assets/images/1.jpg"},
    {"nama": "Rose", "harga": "55000", "gambar": "assets/images/2.jpg"},
    {"nama": "Dahlia", "harga": "20000", "gambar": "assets/images/3.jpg"},
    {"nama": "Aster", "harga": "25000", "gambar": "assets/images/4.jpg"},
    {"nama": "Krisan", "harga": "35000", "gambar": "assets/images/5.jpg"},
    {"nama": "Lily", "harga": "40000", "gambar": "assets/images/6.jpg"},
    {"nama": "Anggrek", "harga": "35000", "gambar": "assets/images/7.jpg"},
    {"nama": "Jakaranda", "harga": "40000", "gambar": "assets/images/8.jpg"},
    {"nama": "Mawar", "harga": "55000", "gambar": "assets/images/9.jpg"},
    {"nama": "Melati", "harga": "50000", "gambar": "assets/images/10.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView.builder(
        itemCount: bunga.length,
        itemBuilder: (context, index) {
          final flower = bunga[index];

          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(flower['gambar'],
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.10),
                        SizedBox(height: 5.0),
                        Image.asset(flower['gambar'],
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.10),
                        SizedBox(height: 5.0),
                        Image.asset(flower['gambar'],
                            width: screenWidth * 0.2,
                            height: screenHeight * 0.10),
                      ],
                    ),
                    SizedBox(width: 0.30),
                    Expanded(
                      child: Transform.translate(
                        offset: Offset(
                            0.0,
                            screenHeight *
                                0.001), // Sesuaikan dengan jumlah translasi yang Anda inginkan
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                flower['nama'],
                                style: TextStyle(
                                  fontSize: screenWidth * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star,
                                      color: const Color.fromARGB(
                                          255, 230, 229, 219)),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(
                                'Harga: ${flower['harga']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.10),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.03, horizontal: 0.06),
                                ),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.01,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.3),
                      child: Image.asset(flower['gambar'],
                          height: screenHeight * 0.2),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Katalog Bunga Diah Munica'), // Judul aplikasi
//           backgroundColor:
//               Color.fromARGB(255, 255, 164, 60), // Warna latar belakang appbar
//           leading: IconButton(
//             icon: Icon(Icons.home), // Tombol home pada appbar
//             onPressed: () {},
//           ),
//         ),
//         body:
//             FlowerListView(), // Menampilkan daftar bunga menggunakan FlowerListView
//       ),
//     );
//   }
// }

// class FlowerListView extends StatefulWidget {
//   @override
//   _FlowerListViewState createState() => _FlowerListViewState();
// }

// class _FlowerListViewState extends State<FlowerListView> {
//   final List<Map<String, dynamic>> bunga = [
//     // Daftar bunga
//     {"nama": "Matahari", "harga": "65000", "gambar": "assets/images/1.jpg"},
//     {"nama": "Rose", "harga": "55000", "gambar": "assets/images/2.jpg"},
//     // ... (daftar bunga lainnya)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: ListView.builder(
//         itemCount: bunga.length,
//         itemBuilder: (context, index) {
//           final flower = bunga[index];

//           return Column(
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.all(16.0),
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 3,
//                       offset: Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Image.asset(flower['gambar'],
//                             width: screenWidth * 0.2,
//                             height: screenHeight * 0.10),
//                         // ... (Tampilkan gambar bunga lainnya)
//                       ],
//                     ),
//                     SizedBox(width: 0.30),
//                     Expanded(
//                       child: Transform.translate(
//                         offset: Offset(0.0, screenHeight * 0.001),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Center(
//                               child: Text(
//                                 flower['nama'], // Menampilkan nama bunga
//                                 style: TextStyle(
//                                   fontSize: screenWidth * 0.02,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.star, color: Colors.yellow),
//                                   // ... (tampilkan bintang rating)
//                                 ],
//                               ),
//                             ),
//                             Center(
//                               child: Text(
//                                 'Harga: ${flower['harga']}', // Menampilkan harga bunga
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       constraints: BoxConstraints(maxWidth: screenWidth * 0.3),
//                       child: Image.asset(flower['gambar'],
//                           height: screenHeight * 0.2),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
