import 'package:cart_demo/models/ProductModel.dart';
import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  List<ProductModel> cart;
  int sum;
  final ValueSetter<ProductModel> valueSetter;


  CheckOutScreen({super.key, required this.cart, required this.sum, required this.valueSetter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cart[index].name),
              subtitle: Text(
                '\$${cart[index].price}',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  valueSetter(cart[index]);
                  // cart.remove(cart[index]);
                  // sum = sum - cart[index].price;
                  
                },
                icon: const Icon(Icons.remove),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: cart.length,
          shrinkWrap: true,
        ),
        Divider(),
        Text('Total \$$sum'),
      ],
    );
  }
}
