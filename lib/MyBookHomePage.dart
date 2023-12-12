import 'package:book_app/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartPage.dart';
import 'ItemTile.dart';

class MyBookHomePage extends StatelessWidget {
  const MyBookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return CartPage();
                },
            ),
          );},
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag_rounded),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('반갑습니다', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('책을 구매하세요', style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(decoration: InputDecoration(
                labelText: 'Search',
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('books', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black54,
              ),),
            ),
            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child){
                return GridView.builder(
                  itemCount: value.shopItems.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,),
                itemBuilder: (context, index) {
                      return ItemTitle(
                        itemname: value.shopItems[index][0],
                        itemprice: value.shopItems[index][1],
                        imagepath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartModel>(context, listen: false).addItemToCart(index);
                        },
                      );
                },);
              },),
            )
          ],
        ),
      ),
    );
  }
}

