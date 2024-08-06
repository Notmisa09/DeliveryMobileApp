import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/Model/menuitem.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final List<CartItem> cartItems;

  const MenuItemCard({super.key, required this.menuItem, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(menuItem.imageUrl),
          Text(menuItem.name),
          Text(menuItem.description),
          Text('Precio: ${menuItem.price}'),
          ElevatedButton(
            onPressed: () {
              // Agregar al carrito
              cartItems.add(CartItem(id: menuItem.id, name: menuItem.name, price: menuItem.price));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${menuItem.name} agregado al carrito'))
              );
            },
            child: const Text('Agregar al carrito'),
          ),
        ],
      ),
    );
  }
}