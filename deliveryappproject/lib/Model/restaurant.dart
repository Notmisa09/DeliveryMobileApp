
import 'package:deliveryappproject/Model/menuitem.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final List<MenuItem> menu;
  final String imageUrl;

  Restaurant({required this.id, required this.name, required this.description, required this.menu, required this.imageUrl});
}

