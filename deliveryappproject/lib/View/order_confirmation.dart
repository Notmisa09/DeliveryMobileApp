import 'package:deliveryappproject/View/restaurant_list.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RestaurantListScreen()),
            );
          },
        ),
        backgroundColor: Colors.green, // Mismo color que el fondo de la pantalla
        elevation: 0, // Quita la sombra para un diseño más limpio
      ),
      body: Container(
        color: Colors.green,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Asegurar que el contenido esté centrado horizontalmente
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(height: 20.0),
              Center( // Añadir este Center para asegurar que el texto esté centrado
                child: Text(
                  'Su pedido ha sido realizado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
