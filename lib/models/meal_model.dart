import 'package:flutter/cupertino.dart';

class Meal {
  String id;
  String name;
  int price;
  int quantity;
  String category;
  Meal({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.quantity,
    @required this.category,
  });
 
}
