import 'package:flutter/foundation.dart';

class Item {
  final String itemName;
  final double price;
  final String imageURL;

  Item({
    @required this.itemName,
    @required this.price,
    @required this.imageURL,
  });
}
