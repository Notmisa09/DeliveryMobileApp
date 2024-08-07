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
          Image.asset(menuItem.imageUrl, width: 130,),
          Text(menuItem.name),
          Text(menuItem.description),
          Text('Precio: ${menuItem.price}'),
          ElevatedButton(
            onPressed: () {
              // Agregar al carrito
              cartItems.add(CartItem(
                id: menuItem.id,
                name: menuItem.name, 
                price: menuItem.price, 
                imageUrl: menuItem.imageUrl
                ));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${menuItem.name} agregado al carrito'))
              );
            },
        style: ButtonStyle(
    backgroundColor:  WidgetStateProperty.all<Color>(Colors.black), // Establece el color de fondo aquí
  ),
            child: const Text(
           'Agregar al carrito',
         style: TextStyle(color: Colors.white
         ),
        ),        
        ),
        ],
      ),
    );
  }
}