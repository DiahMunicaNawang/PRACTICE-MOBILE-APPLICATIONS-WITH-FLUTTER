import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bio Diah Munica Nawang'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            side: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Nama Saya Diah Munica Nawang.',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Image.asset('lib/assets/image/Mona.jpeg', width: 150.0), // Mengatur width menjadi 150.0
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'NIM: V392015\n'
                  'Program Study: D3 Teknik Informatika\n'
                  'Universitas: Sebelas Maret\n'
                  'TTL: Magetan, 15 Juli 2003\n'
                  'Hobby: Menulis\n'
                  'Motto: Doa Ibu Nomor Satu',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blue, // Mengatur latar belakang biru
      ),
    );
  }
}
