
import 'package:deneme_flutter/components/bottomNavigation.dart';
import 'package:deneme_flutter/components/capacityOption.dart';
import 'package:deneme_flutter/components/colorOption.dart';
import 'package:deneme_flutter/components/header.dart';
import 'package:deneme_flutter/pages/product_update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/wishList_bloc.dart';
import '../data/dbHelper.dart';
import '../models/Product.dart';
import '../models/cart.dart';
import '../models/wishList.dart';
import '../providers/cart_provider.dart';
import 'home.dart';

class ProductDetailPage extends StatefulWidget {
 Product product;

  ProductDetailPage(this.product);

  @override
  _ProductDetailPage createState() {
    return _ProductDetailPage(product);
  }

}

enum Options{delete,update}
var dbHelper = DbHelper();

class _ProductDetailPage extends State<ProductDetailPage> {
  Product product;
  _ProductDetailPage(this.product);

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
    final cart = Provider.of<CartProvider>(context);
    void addProduct() {
      wishListBloc.addToWishList(WishList(product,1));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }

    void saveData(Product product) {
      dbHelper
          .cartInsert(
        Cart(
          productId: product.id.toString(),
          productName: product.name,
          initialPrice: int.tryParse(product.unitPrice),
          productPrice: int.tryParse(product.unitPrice),
          image: product.photoUrl,
          quantity: ValueNotifier(1),
        ),
      )
          .then((value) {
        cart.addTotalPrice(double.tryParse(product.unitPrice)!);
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<Options>(
            onSelected: selectProcess,
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                value: Options.delete,
                child: Text("Sil"),
              ),
              const PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Güncelle"),
              ),
            ],
          )
        ],
      ),
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //HEADER
            header(product.name),
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
                       product.photoUrl,
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
                    SizedBox(height: 16,),
                    // Ürün Açıklaması
                    Center(
                      child: Text(
                        "Ürün Açıklaması",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0A1034)),
                      ),
                    ),
                    Text(product.description, style: TextStyle(fontSize:18),),

                    //SEPETE EKLE
                    SizedBox(height: 32),
                    GestureDetector(
                      onTap: (){
                        addProduct();
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
                        saveData(product);
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

           bottomNavigationBar("search", context),
    ])));




  }



   void selectProcess(Options options) async{
     switch(options){
       case Options.delete:
         await dbHelper.delete(product.id);
         Navigator.push(this.context, MaterialPageRoute(builder: (context)=>HomePage()));
         break;
       case Options.update:
         await Navigator.push(this.context, MaterialPageRoute(builder: (context)=>ProductUpdate(product)));
         Navigator.pop(context,true);
         break;
       default:
     }
   }
}





