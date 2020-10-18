import 'package:flutter/material.dart';
import 'package:hack_gt_2020/screens/menu_screen.dart';
import '../models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  String name;
  String imageURL;
  String productURL;

  RestaurantCard(@required Restaurant r) {
    name = r.name;
    imageURL = r.imageURL;
    productURL = r.productURL;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed('/menu-screen', arguments: {'name': name});
      }, // screen(input) Navigator.push() blahblah
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageURL,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  height: 50,
                  width: 400,
                  child: Text(
                    name,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.70)),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 15,
              child: Container(
                height: 80,
                width: 80,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(productURL), fit: BoxFit.fill),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
