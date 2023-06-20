import '../models/wishList.dart';

class WishListService{
  static List<WishList> wishListItems = [];

  static final WishListService _singleton = WishListService._internal();

  factory WishListService(){
    return _singleton;
  }

  WishListService._internal();

  static void addToWishList(WishList item){
    wishListItems.add(item);
  }

  static void removeFromWishList(WishList item){
    wishListItems.remove(item);
  }

  static List<WishList> getWishList(){
    return wishListItems;
  }
}