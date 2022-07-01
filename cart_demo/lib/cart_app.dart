import 'package:badges/badges.dart';
import 'package:cart_demo/models/ProductModel.dart';
import 'package:cart_demo/screens/checkoutScreen.dart';
import 'package:cart_demo/screens/productScreen.dart';
import 'package:flutter/material.dart';

class CartApp extends StatefulWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  State<CartApp> createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Cart Application'),
          actions: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 8, 15, 8),
              child: Badge(
                badgeContent: Text(
                  '${cart.length}',
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.shopping_cart),
              ),
            ),
          ],
          bottom:const TabBar(
            tabs: [
              Tab(
                text: 'Products',
              ),
              Tab(
                text: 'Checkout',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProductScreen(
              valueSetter: (value) {
                setState(() {
                  cart.add(value);
                  sum = 0;
                  cart.forEach((ProductModel element) {
                    sum += element.price;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${value.name} is added to cart'),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                });
              },
            ),
            CheckOutScreen(
                cart: cart,
                sum: sum,
                valueSetter: (value) {
                  setState(() {
                    cart.remove(value);
                    sum -= value.price;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${value.name} is removed from cart'),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  });
                }),
          ],
        ),
      ),
    );
  }
}
