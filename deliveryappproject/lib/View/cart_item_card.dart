import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;

  const CartItemCard({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(cartItem.name),
          Text('Precio: ${cartItem.price}'),
        ],
      ),
    );
  }
}