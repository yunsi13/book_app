import 'package:book_app/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('My Cart', style: TextStyle(
                fontSize: 42, fontWeight: FontWeight.bold, color: Colors.black87,
              ),)),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: Image.asset(value.cartItems[index][2],),
                      title : Text(value.cartItems[index][0]),
                      subtitle: Text(value.cartItems[index][1]+"원"),
                      trailing: IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () => Provider.of<CartModel>(
                              context,
                              listen: false).removeItemFromCart(index),
                        ),
                    ),
                  ),
                );
              },
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue,
                  borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("총 합", style: TextStyle(
                            fontSize: 16, color: Colors.green[100],
                          ),),
                          SizedBox(height: 6,),
                          Text(value.calculateTotal() + "원", style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,
                          ),),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade100),
                        borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text('결제하기', style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,
                      ),),
                              Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.white,),
                            ],
                          ),
                        ),),

                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
