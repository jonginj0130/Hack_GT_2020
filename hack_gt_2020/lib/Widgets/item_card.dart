import 'package:flutter/material.dart';
import 'package:hack_gt_2020/screens/item_order_screen.dart';

class ItemCard extends StatelessWidget {
  @override
  final String itemName;
  final double price;
  final String imageURL;

  ItemCard({
    @required this.itemName,
    @required this.price,
    @required this.imageURL,
  });

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ItemOrderScreen(
              itemName: this.itemName,
              price: this.price,
              imageURL: this.imageURL,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Container(
                child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('\$' '$price'))),
          ],
        ),
      ),
    );
  }
}
