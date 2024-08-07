import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/Model/menuitem.dart';
import 'package:deliveryappproject/Model/restaurant.dart';
import 'package:deliveryappproject/View/cart_screen.dart';
import 'package:deliveryappproject/View/restaurant_card.dart';
import 'package:flutter/material.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<Restaurant> restaurants = [
    // Example restaurants
    Restaurant(id: '1', name: 'Restaurante Capriccio', description: 'Comida italiana', menu: [
      MenuItem(id: '1', name: 'Pizza', price: 8.5, description: 'Deliciosa pizza margarita', imageUrl:'assets/images/pizza_margarita.jpg'),
      // Other items
    ],
     imageUrl: 'assets/images/restaurant_capriccio.jpg'
    ),
    // Other restaurants
  ];

  final List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
        actions: [
          IconButton(
              icon: const Icon(Icons.fastfood, color: Colors.black),
             // Ruta del logo
            onPressed: () {
              // Opcional: Acción al presionar el logo

            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
              );
            },
          ),
        ],
        backgroundColor: Colors.orange, // Color del AppBar similar al login
      ),
      body: Container(
        color: const Color.fromARGB(255, 215, 180, 63).withOpacity(.2), // Fondo similar al de los campos de texto en el login
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RestaurantCard(restaurant: restaurants[index], cartItems: cartItems),
            );
          },
        ),
      ),
    );
  }
}
