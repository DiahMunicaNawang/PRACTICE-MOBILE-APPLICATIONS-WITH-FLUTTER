import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class SkincareProduct {
  final String name;
  final String description;
  final int price;

  SkincareProduct(this.name, this.description, this.price);
}

class MyApp extends StatelessWidget {
  final List<List<List<SkincareProduct>>> skincareData = [
    [
      [
        SkincareProduct('Skintific',
            'Moisturizer,Toner,Serum,Wacial Wash,Eye Cream', 612000),
        SkincareProduct(
            'Avoskin', 'Toner,Serum,Facial Wash,Misellar Water', 517000),
      ],
      [
        SkincareProduct(
            'Something', 'Serum,Toner,Moisturezer,Milk Cleanser', 435000),
        SkincareProduct(
            'Wardah', 'Facial Wash,Moisturezer,Toner,Sunscreen', 341000),
      ],
    ],
    [
      [
        SkincareProduct(
            'Maybelline', 'Cushion,Eye Shadow,Conture,Lipstik', 821000),
        SkincareProduct('Loreal', 'Mascara,Eyeliner,Fondation,Liptint', 632000),
      ],
      [
        SkincareProduct(
            'Make Over', 'Blush On,Lipstik,Two Way Cake,Highligter', 569000),
        SkincareProduct(
            'Rare Beauty', 'Lipstick,Concealar,Bedak Tabur,Maskara', 425000),
      ],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.store,
                    color: Colors.white), // Icon to the left of the title
                Text(' Beauty Shop Diah Munica ',
                    style: TextStyle(color: Colors.white)),
                Icon(Icons.store,
                    color: Colors.white), // Icon to the right of the title
              ],
            ),
          ),
          backgroundColor: Colors.pink, // Pink background
        ),
        body: ListView.builder(
          itemCount: skincareData.length,
          itemBuilder: (context, outerIndex) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    outerIndex == 0
                        ? 'Kategori Paket Skincare'
                        : 'Kategori Paket Make Up', // Change category names
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 253, 127, 169)),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: skincareData[outerIndex].length,
                  itemBuilder: (context, innerIndex) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: skincareData[outerIndex][innerIndex]
                          .map(
                            (product) => Card(
                              child: ListTile(
                                title: Text(product.name),
                                subtitle: Text(product.description),
                                trailing: Text(
                                    'Rp ${product.price.toString()}'), // Display price in Rupiah
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
                if (outerIndex == 0)
                  Container(
                    color: Colors.red, // Warna latar belakang merah
                    child: Center(
                      child: ListTile(
                        title: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Diskon 50%',
                            style: TextStyle(
                              color: Colors.white, // Warna teks putih
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ), 
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
