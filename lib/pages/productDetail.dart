import 'package:deneme_flutter/components/bottomNavigation.dart';
import 'package:deneme_flutter/components/capacityOption.dart';
import 'package:deneme_flutter/components/colorOption.dart';
import 'package:deneme_flutter/components/header.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;
  String photoUrl;

  ProductDetailPage(this.productTitle, this.photoUrl);

  @override
  _ProductDetailPage createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
   Color selectedColor = Color(0);
   int selectedCapacity = 64;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  List<int> capacities = [64, 256, 512];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //HEADER
            header(widget.productTitle, context),
            SizedBox(
              height: 32,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //NEW ETİKETİ
                    //label("New"),



                    //ÜRÜN FOTOĞRAFI
                    Center(
                      child: Image.asset(
                       widget.photoUrl,
                        width: 150,
                        height: 200,
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    //RENK SEÇENEKLERİ
                    Center(
                      child: Text(
                        "Renk",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A1034)),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: colors.map((Color color) => colorOption( color:color, selected: selectedColor == color, onPress: (){
                        setState(() {
                          selectedColor = color;
                        });
                      })).toList(),
                    ),

                    //KAPASİTE SEÇENEKLERİ
                    SizedBox(height: 32,),

                    Center(
                      child: Text(
                        "Kapasite",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A1034)),
                      ),
                    ),
                    SizedBox(height: 16,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                        capacities.map((int number) => capacityOption(capacity: number, selected: selectedCapacity == number, onPress: (){
                          setState(() {
                            selectedCapacity = number;
                          });
                        })).toList(),
                    ),
                    //SEPETE EKLE
                    SizedBox(height: 32),
                    GestureDetector(
                      onTap: (){
                        print("Ürün sepete eklendi.");
                        print("Ürün İsmi: " + widget.productTitle);
                        print("Ürün rengi: " + selectedColor.value.toString());
                        print("Ürün kapasitesi: " + selectedCapacity.toString() + " gb");

                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.deepOrangeAccent,
                        ),
                        child: Text("İstek Listesine Ekle", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: (){
                        print("Ürün sepete eklendi.");
                        print("Ürün İsmi: " + widget.productTitle);
                        print("Ürün rengi: " + selectedColor.value.toString());
                        print("Ürün kapasitesi: " + selectedCapacity.toString() + " gb");
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFF1F53E4),
                        ),
                        child: Text("Sepete ekle", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),),
                      ),
                    ),
                    SizedBox(height: 100,),

                  ],
                ),
              ),
            ),
          ])),
           
           bottomNavigationBar("search"),
    ])));
  }
}




