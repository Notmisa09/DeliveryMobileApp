import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/Model/menuitem.dart';
import 'package:deliveryappproject/Model/restaurant.dart';
import 'package:deliveryappproject/View/cart_screen.dart';
import 'package:deliveryappproject/View/restaurant_card.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class RestaurantListScreen extends StatelessWidget {
  final List<Restaurant> restaurants = [
    // Example restaurants
    Restaurant(
      id: '1',
      name: 'Restaurante Capriccio',
      description: 'Comida italiana',
      menu: [
        MenuItem(id: '1', name: 'Pizza Margarita', price: 8.5, description: 'Deliciosa pizza margarita', imageUrl:'assets/images/pizza_margarita.jpg'),
        MenuItem(id: '2', name: 'Lasagna', price: 9.5, description: 'Lasagna al horno', imageUrl: 'assets/images/lasagna.jpg'),
        MenuItem(id: '3', name: 'Calzone', price: 8.0, description: 'Calzone pizza con peperini y queso', imageUrl: 'assets/images/calzone_pizza.jpg'),
        MenuItem(id: '4', name: 'Pasta Carbonara', price: 7.5, description: 'Pasta con salsa carbonara', imageUrl: 'assets/images/pasta_carbonara.jpg'),
      // Other items
    ],
     imageUrl: 'assets/images/restaurant_capriccio.jpg'
    ),
    Restaurant(
      id: '2',
      name: 'Jade Teriyaki',
      description: 'Comida asiática',
      menu: [
        MenuItem(id: '1', name: 'Pollo Teriyaki', price: 10.0, description: 'Pollo con salsa teriyaki', imageUrl: 'assets/images/pollo_teriyaki.jpg'),
        MenuItem(id: '2', name: 'Cerdo Teriyaki', price: 11.0, description: 'Cerdo con salsa teriyaki', imageUrl: 'assets/images/cerdo_teriyaki.jpg'),
        MenuItem(id: '3', name: 'Res Teriyaki', price: 12.0, description: 'Res con salsa teriyaki', imageUrl: 'assets/images/res_teriyaki.jpg'),
        MenuItem(id: '4', name: 'Chow Fan Camarones', price: 8.5, description: 'Arroz frito con camarones', imageUrl: 'assets/images/chow_fan_camarones.jpeg'),
      ],
      imageUrl: 'assets/images/restaurant_jade.jpg',
    ),
    Restaurant(
      id: '3',
      name: 'Hummus Restaurant',
      description: 'Comida del Medio Oriente',
      menu: [
        MenuItem(id: '1', name: 'Pita & Falafel', price: 9.5, description: 'Pita con falafel', imageUrl: 'assets/images/pita_&_falafel.jpg'),
        MenuItem(id: '2', name: 'Habibi Platter', price: 12.0, description: 'Res, pollo, 2 cremas, ensalada tabulé, pan pita. ', imageUrl: 'assets/images/habibi_platter.jpg'),
        MenuItem(id: '3', name: 'El Arabito', price: 11.0, description: 'Res, pollo, croquetas de falafel, ensalada tabulé, salsa de la casa.', imageUrl: 'assets/images/el_arabito.jpg'),
        MenuItem(id: '4', name: 'Dominican Paradise', price: 10.0, description: 'Pollo crispy, queso cheddar, tocino, cebolla encurtida, mermelada de plátano maduro.', imageUrl: 'assets/images/dominican_paradise.jpg'),
        MenuItem(id: '5', name: 'Jugo de Jamaica', price: 4.0, description: 'Delicioso Jugo de Jamaica', imageUrl: 'assets/images/jugo_flor_jamaica.png'),
      ],
      imageUrl: 'assets/images/restaurant_hummus.jpg',
    ),
    Restaurant(
      id: '4',
      name: 'Helados Valentino',
      description: 'Postres y Helados',
      menu: [
        MenuItem(id: '1', name: 'Paletas Frutales', price: 3.0, description: 'Paletas de frutas frescas', imageUrl: 'assets/images/Paletas_Frutales.jpg'),
        MenuItem(id: '2', name: 'Brownie Valentino', price: 4.5, description: 'Brownie con helado', imageUrl: 'assets/images/Brownie_Valentino.jpg'),
        MenuItem(id: '3', name: 'Tartalini', price: 5.0, description: 'Tartaleta de frutas', imageUrl: 'assets/images/tartalini.jpg'),
        MenuItem(id: '4', name: 'Waffle Valentino', price: 6.0, description: 'Waffle con helado y frutas', imageUrl: 'assets/images/Waffle_Valentino.jpg'),
      ],
      imageUrl: 'assets/images/restaurant_helados_valentino.jpeg',
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
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cartItems: cartItems)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantCard(restaurant: restaurants[index], cartItems: cartItems);
        },
      ),
    );
  }
}