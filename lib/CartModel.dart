import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    // [_itemname,_itemprice,_imagepath,color]
    ["물고기는 존재하지 않는다", "20000", "assets/whyfish.jpg", Colors.blue],
    ["나는 소망한다 내게 금지된 것을", "20000", "assets/ihope.jpeg", Colors.blueAccent],
    ["파과", "20000", "assets/goo.jpeg", Colors.pinkAccent],
    ["트렌드코리아 2024", "20000", "assets/trendkorea.jpeg", Colors.deepOrangeAccent],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculateTotal() {
    int totalPrice = 0;
    for(int i=0; i<_cartItems.length; i++) {
      totalPrice += int.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(0);
  }
}