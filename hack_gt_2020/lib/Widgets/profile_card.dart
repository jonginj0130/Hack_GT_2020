import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  String name = "k-bbq";
  String email = "bbg@hackgt.edu";

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
                CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.business2community.com%2Ffacebook%2Fmanage-professional-facebook-profile-0860879&psig=AOvVaw2SlDfJU6UON4SGaryLGzZy&ust=1603083592956000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNiGivOtvewCFQAAAAAdAAAAABAI')),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$name',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('$email',
                            style: TextStyle(
                              fontSize: 10,
                            )),
                      ]),
                ),
              ],
            )));
  }
}
