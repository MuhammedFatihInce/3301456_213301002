import 'dart:async';


import '../data/wishList_service.dart';
import '../models/wishList.dart';

class WishListBloc{
  final wishListStreamController = StreamController.broadcast();

  Stream get getStream => wishListStreamController.stream;

  void addToWishList(WishList item){
    WishListService.addToWishList(item);
    wishListStreamController.sink.add(WishListService.getWishList());
  }

  void removeFromWishList(WishList item){
    WishListService.removeFromWishList(item);
    wishListStreamController.sink.add(WishListService.getWishList());
  }

  List<WishList> getWishList(){
    return WishListService.getWishList();
  }
}

final wishListBloc = WishListBloc();