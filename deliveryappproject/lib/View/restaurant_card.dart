import 'package:deliveryappproject/Model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:deliveryappproject/View/menu_screen.dart';
import 'package:deliveryappproject/Model/cart_item.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final List<CartItem> cartItems;

  // ignore: use_key_in_widget_constructors
  const RestaurantCard({required this.restaurant, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(restaurant.imageUrl),
          Text(restaurant.name),
          Text(restaurant.description),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuScreen(restaurant: restaurant, cartItems: cartItems)),
              );
            },
            child: const Text('Ver menú'),
          ),
        ],
      ),
    );
  }
}
