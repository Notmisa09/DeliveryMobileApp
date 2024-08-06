import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/Model/restaurant.dart';
import 'package:deliveryappproject/View/menu_item_card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;
   final List<CartItem> cartItems;

  const MenuScreen({super.key, required this.restaurant, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: ListView.builder(
        itemCount: restaurant.menu.length,
        itemBuilder: (context, index) {
          return MenuItemCard(menuItem: restaurant.menu[index], cartItems: cartItems);
        },
      ),
    );
  }
}