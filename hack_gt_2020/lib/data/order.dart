import 'package:flutter/material.dart';

class Order {
  final double price;
  final String itemName;

  Order({
    @required this.itemName,
    @required this.price,
  });
}
