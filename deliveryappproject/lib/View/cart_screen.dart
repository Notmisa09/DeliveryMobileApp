import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/View/cart_item_card.dart';
import 'package:deliveryappproject/View/order_confirmation.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (total, item) => total + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor: Colors.orange, // Estilo similar al login
        actions: [
          IconButton(
            icon: const Icon(Icons.fastfood),
            onPressed: () {
              // Acción opcional para el logo
            },
          ),
        ],
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                'Carrito vacío',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white, // Fondo blanco para las tarjetas de los artículos
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CartItemCard(cartItem: cartItems[index]),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderConfirmationScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 19, 18, 19), // Color similar al botón de login
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Pagar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
