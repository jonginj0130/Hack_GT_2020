import 'dart:io';
import 'package:flutter/material.dart';
import '../data/ncrURL.dart';
import 'dart:convert';
import 'package:http/http.dart';

class ItemOrderScreen extends StatefulWidget {
  @override
  final String itemName;
  final double price;
  final String imageURL;

  ItemOrderScreen({
    @required this.itemName,
    @required this.price,
    @required this.imageURL,
  });

  _ItemOrderScreenState createState() => _ItemOrderScreenState();
}

class _ItemOrderScreenState extends State<ItemOrderScreen> {
  @override
  double _serving = 1;

  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final String username = 'f2e5a23b-c8a9-4753-9423-b5d871044ebf';
    final String password = 'password123456789!!!';
    final String credentials = '$username:$password';
    final stringToBase64 = utf8.fuse(base64);
    final encodedCredentials = stringToBase64.encode(credentials);

    String id;

    showSucessOrderDialog(BuildContext context) {
    Widget backButton = FlatButton(
      child: Text("Return Home"),
      onPressed: () {
        Navigator.pushNamed(context, '/');
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Sucessfully Ordered!"),
      content: Text("Have a nice meal!"),
      actions: [backButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

    _postOrder() async {
      String url = 'https://gateway-staging.ncrcloud.com/order/3/orders/1';
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic $encodedCredentials',
        'nep-organization': '35b1b5b3e6f349458a80e331d7ff034e',
        'nep-enterprise-unit': 'd4f2c2ca58074a22a0af6217647d7fb4',
        'Date': HttpHeaders.etagHeader
      };
      print(widget.itemName);
      print(widget.price);
      String json =
          '{"lineId" : "${widget.itemName}" , "comments": "String", "description" : "String", "extendedAmount" : ${widget.price}, "itemType" : "String"}';
      //'{"itemName" : "${widget.itemName}" , "price" : "${widget.price}"}';
      Response response = await post(url, headers: headers, body: json);

      int statusCode = response.statusCode;

      String body = response.body;

      Map<String, dynamic> result = jsonDecode(body);

      id = result['id'];

      print(body);
      print(id);
    }

    _getOrder() async {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic $encodedCredentials',
        'nep-organization': '35b1b5b3e6f349458a80e331d7ff034e',
        'nep-enterprise-unit': 'd4f2c2ca58074a22a0af6217647d7fb4',
        'Date': HttpHeaders.etagHeader
      };
      String url = 'https://gateway-staging.ncrcloud.com/order/orders/' + id;
      print(url);
      Response response = await get(url, headers: headers);
      int statusCode = response.statusCode;
      print(statusCode);
      String json = response.body;
      print(json);
      print(response);
      Map<String, dynamic> body = jsonDecode(json);
      String itemName = body["itemName"];
      //double price = double.parse(body['price']);
      print(itemName);
      //print(price);
    }

    int points = ((1 - _serving) * 0.7 * widget.price * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          width: 40,
          child: Image.network(ncrURL),
        ),
      ),
      body: LayoutBuilder(builder: (ctx, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    height: 150,
                    width: 150,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.imageURL),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: (constraints.maxWidth - 150) * 0.8,
                        child: Center(
                          child: Text(
                            '${widget.itemName}',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        width: (constraints.maxWidth - 150) * 0.8,
                        child: Center(
                          child: Text(
                            '\$${widget.price} / serving',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text('Choose how much you want!'),
                Slider(
                  value: _serving,
                  min: 0.4,
                  max: 1.6,
                  divisions: 6,
                  onChanged: (value) {
                    setState(() {
                      _serving = value;
                    });
                  },
                  label: _serving.toStringAsFixed(1).toString() + ' serving',
                  activeColor: Theme.of(context).primaryColor,
                  inactiveColor: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Text('Total: ' + '\$${widget.price}'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  child: Text('Points: ' + '$points'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // RaisedButton(
                //   child: Text(
                //     'Get Order',
                //     style: TextStyle(color: Colors.grey),
                //   ),
                //   color: Theme.of(context).primaryColor,
                //   onPressed: _getOrder,
                // ),
                RaisedButton(
                  child: Text('Pay Now!', style: TextStyle(color: Colors.grey)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    showSucessOrderDialog(context);
                    _postOrder();
                  },
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
