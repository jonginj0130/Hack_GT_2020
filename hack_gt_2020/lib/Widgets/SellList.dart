import 'package:flutter/material.dart';

class SellList {
  double points;
  double price;

  SellList({double points, double price}) {
    this.points = points;
    this.price = price;
  }
}

/*

class SellLists extends StatefulWidget {
  @override
  _SellListsState createState() => _SellListsState();
}

class _SellListsState extends State<SellLists> {
  List<SellList> sellLists = [
    SellList(points: 500, price: 3),
    SellList(points: 400, price: 3),
    SellList(points: 300, price: 3),
    SellList(points: 500, price: 3),
    SellList(points: 200, price: 3),
    ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(actions: [],)
      
    );
  }
} */
