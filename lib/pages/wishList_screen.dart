import 'package:deneme_flutter/pages/productDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../blocs/wishList_bloc.dart';
import '../models/Product.dart';

class WishListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("İstek Listesi"),
        ),
        body: StreamBuilder(
          stream: wishListBloc.getStream,
          initialData: wishListBloc.getWishList(),
          builder: (context, snapshot){
            return buildWishList(snapshot);
          },
        )
    );
  }

  Widget buildWishList(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index){
          final wishList = snapshot.data;
          return ListTile(
            onTap: (){goToDetail(wishList[index].product, context);},
            leading: CircleAvatar(backgroundColor: Colors.black12,child: Image.asset(wishList[index].product.photoUrl),),
            title: Text(wishList[index].product.name),
            subtitle: Text(wishList[index].product.unitPrice.toString()),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: (){
                wishListBloc.removeFromWishList(wishList[index]);
              },
            ),
          );
        }
    );
  }

  void goToDetail(Product product, BuildContext context) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage(product)));
  }
}