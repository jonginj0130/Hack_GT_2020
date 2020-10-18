import 'package:flutter/material.dart';
//import 'package:temp_kbbq/data/points.dart';

class SellPointsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Text(' points'),
                    FlatButton.icon(
                        onPressed: () {},
                        label: Text('price'),
                        icon: Icon(Icons.attach_money))
                  ],
                )
              ],
            )));
  }
}
