import 'package:flutter/material.dart';
import '../data/coinURL.dart';
import '../data/points.dart';
import '../data/foodList.dart';
import '../Widgets/item_card.dart';

class MenuScreen extends StatelessWidget {
  @override
  static const routeName = '/menu-screen';

  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final String restaurantName = routeArgs['name'];
    final int pointsAccumulated = points;

    MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('$restaurantName' + ' Menu')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5.0, right: 5.0),
            padding: EdgeInsets.all(3.0),
            height: mediaQuery.size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Image.network(coinURL),
                ),
                FittedBox(
                  child: Text(
                    '$pointsAccumulated' + ' pts',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: foodList[restaurantName].length,
                itemBuilder: (ctx, index) {
                  return ItemCard(
                    itemName: foodList[restaurantName][index].itemName,
                    price: foodList[restaurantName][index].price,
                    imageURL: foodList[restaurantName][index].imageURL,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
