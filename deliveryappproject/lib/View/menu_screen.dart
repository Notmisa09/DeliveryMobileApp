import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/Model/restaurant.dart';
import 'package:deliveryappproject/View/menu_item_card.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final Restaurant restaurant;
  final List<CartItem> cartItems;

  const MenuScreen({super.key, required this.restaurant, required this.cartItems});

  void _logout(BuildContext context) {
    // Implementa aquí la lógica de cierre de sesión, como limpiar datos de usuario
    Navigator.of(context).popUntil((route) => route.isFirst); // Vuelve a la primera pantalla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.fastfood),
            onPressed: () {
              // Opcional: Acción al presionar el logo
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
        backgroundColor: Colors.orange, // Estilo similar a la pantalla de inicio de sesión
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 180, 63).withOpacity(.2), // Fondo similar al de los campos de texto en el login
        child: ListView.builder(
          itemCount: restaurant.menu.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white, // Fondo blanco para las tarjetas
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: MenuItemCard(menuItem: restaurant.menu[index], cartItems: cartItems),
              ),
            );
          },
        ),
      ),
    );
  }
}
