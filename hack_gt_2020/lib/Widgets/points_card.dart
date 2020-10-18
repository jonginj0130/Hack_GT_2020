import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
//import 'package:hack_gt_2020/Widgets/sell_points_card.dart';
import 'SellList.dart';

/*
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
                    Text('100 points'),
                    SizedBox(
                      width: 50,
                    ),
                    FlatButton.icon(
                        onPressed: () {},
                        label: Text('2'),
                        icon: Icon(Icons.money))
                  ],
                )
              ],
            )));
  }
} */

class PointsCard extends StatelessWidget {
  final points = 300; // temporary

  List<SellList> sellLists = [
    SellList(points: 500, price: 3),
    SellList(points: 400, price: 3),
    SellList(points: 300, price: 3),
    SellList(points: 500, price: 3),
    SellList(points: 200, price: 3),
  ];

  showPurchaseDialog(BuildContext context) {
    Widget backButton = FlatButton(
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    //set up the alertdialog
    AlertDialog alert = AlertDialog(
      title: Text("Purchase Points"),
      content: Column(
        children: [
          Text("choose how much you would like to buy"),
          Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('100 points'),
                          SizedBox(
                            width: 50,
                          ),
                          FlatButton.icon(
                            onPressed: () {
                              showSucessBuyDialog(context);
                            },
                            label: Text('2'),
                            icon: Icon(Icons.attach_money),
                            color: Colors.lightGreen[300],
                          )
                        ],
                      )
                    ],
                  ))),
          Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('500 points'),
                          SizedBox(
                            width: 50,
                          ),
                          FlatButton.icon(
                            onPressed: () {
                              showSucessBuyDialog(context);
                            },
                            label: Text('4'),
                            icon: Icon(Icons.attach_money),
                            color: Colors.lightGreen[300],
                          )
                        ],
                      )
                    ],
                  ))),
          Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('400 points'),
                          SizedBox(
                            width: 50,
                          ),
                          FlatButton.icon(
                            onPressed: () {
                              showSucessBuyDialog(context);
                            },
                            label: Text('3'),
                            icon: Icon(Icons.attach_money),
                            color: Colors.lightGreen[300],
                          )
                        ],
                      )
                    ],
                  ))),
          Card(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: [
                          Text('300 points'),
                          SizedBox(
                            width: 50,
                          ),
                          FlatButton.icon(
                            onPressed: () {
                              showSucessBuyDialog(context);
                            },
                            label: Text('2'),
                            icon: Icon(Icons.attach_money),
                            color: Colors.lightGreen[300],
                          )
                        ],
                      )
                    ],
                  )))
        ],
      ),
      actions: [backButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Buy Sucess
  showSucessBuyDialog(BuildContext context) {
    Widget backButton = FlatButton(
      child: Text("Close"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Sucessfully Purchased"),
      content: Text("You can use the points whenever needed!"),
      actions: [backButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Sell
  showSellDialog(BuildContext context) {
    Widget backButton = FlatButton(
      child: Text("Back"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget sellButton = FlatButton(
      child: Text("Sell"),
      onPressed: () {
        showSucessDialog(context);
      },
    );

    //set up the alertdialog
    AlertDialog alert = AlertDialog(
      title: Text("Sell Your Points"),
      content: Column(
        children: [
          Text("Choose how many points you would like to sell"),
          SpinBox(
            min: 100,
            max: 50000,
            value: 100,
            step: 100,
            onChanged: (value) => print(value),
          )
        ],
      ),
      actions: [backButton, sellButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  //Sell Sucess
  showSucessDialog(BuildContext context) {
    Widget backButton = FlatButton(
      child: Text("Close"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Sucessfully Posted"),
      content: Text("We will let you know when someone buys your points!"),
      actions: [backButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.toll), //Icons.attach_money
              FittedBox(
                child: Text(
                  '$points' + ' pts',
                ),
              ),
              SizedBox(
                width: 15,
              ),
              FlatButton(
                  onPressed: () {
                    showPurchaseDialog(context);
                  },
                  child: Text('buy'),
                  color: Colors.lightGreen),
              FlatButton(
                  onPressed: () {
                    showSellDialog(context);
                  },
                  child: Text('sell'),
                  color: Colors.lightGreen)
            ],
          ),
        ));
  }
}
