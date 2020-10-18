import 'package:flutter/material.dart';
import 'package:hack_gt_2020/Widgets/points_card.dart';
import 'package:hack_gt_2020/Widgets/profile_card.dart';
import 'package:hack_gt_2020/Widgets/my_orders_card.dart';

/// Flutter code sample for Card

// This sample shows creation of a [Card] widget that shows album information
// and two actions.

/// This is the main application widget.
///
///

class PersonalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(title: Text('My Profile')),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ProfileCard(),
            //Divider(color: Colors.grey[800]),
            PointsCard(),
            MyOrdersCard()
          ],
        ),
      ),
    );
  }
}
// class PersonalScreen extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: MyPage(),
//       ),
//     );
//   }
// }

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   String name = "k-bbq";
//   String email = "bbg@hackgt.edu";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[400],
//         appBar: AppBar(title: Text('My Profile')),
//         body: Container(
//             color: Colors.grey[300],
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 ProfileCard(),
//                 //Divider(color: Colors.grey[800]),
//                 PointsCard(),
//                 MyOrdersCard()
//               ],
//             )));
//   }
// }
//Divider(color: Colors.grey[600])
