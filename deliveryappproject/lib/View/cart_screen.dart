import 'package:deliveryappproject/Model/cart_item.dart';
import 'package:deliveryappproject/View/cart_item_card.dart';
import 'package:deliveryappproject/View/order_confirmation.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems;

  // ignore: use_key_in_widget_constructors
  const CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (total, item) => total + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Carrito vacío'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      return CartItemCard(cartItem: cartItems[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total: \$${totalPrice.toStringAsFixed(2)}'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OrderConfirmationScreen()),
                          );
                        },
                        child: const Text('Pagar'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}