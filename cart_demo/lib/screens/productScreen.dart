
import 'package:cart_demo/models/ProductModel.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> valueSetter;

  ProductScreen({super.key, required this.valueSetter});


  List<ProductModel> products = [
    ProductModel(name: 'Mic', price: 50),
    ProductModel(name: 'Earphone', price: 1000),
    ProductModel(name: 'TV', price: 10000),
    ProductModel(name: 'Mouse', price: 200),
    ProductModel(name: 'Tab', price: 5000),
    ProductModel(name: 'CD', price: 5),
  ];

  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          trailing: Text(
            '\$${products[index].price}',
            style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            valueSetter(products[index]);
            
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: products.length,
    );
  }
}
