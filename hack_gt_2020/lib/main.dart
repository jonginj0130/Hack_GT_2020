import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hack_gt_2020/Widgets/restaurant_card.dart';
import 'package:hack_gt_2020/models/restaurant.dart';
import 'package:hack_gt_2020/screens/menu_screen.dart';
import './screens/personal_screen.dart';
import './data/points.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent[400],
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'NCR Food Waste'),
      initialRoute: '/',
      routes: {'/menu-screen': (ctx) => MenuScreen()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String ncrURL =
      'https://upload.wikimedia.org/wikipedia/commons/0/0c/NCR_Brand_Block_Logo_PNG.png';

  static String coinURL =
      'https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/money_coins2.png';

  int _points = points;
  
  List<Restaurant> displayRestaurantList = [
    Restaurant(
        name: 'McDonald\'s',
        productURL:
            'https://assets.entrepreneur.com/content/3x2/2000/20190620160543-mcdonalds-vegan-burger.jpeg',
        imageURL:
            'https://geekzilla.tech/home/wp-content/uploads/2020/07/shutterstock_1181606473-1200x800-1.jpg'),
    Restaurant(
        name: 'Cheesecake Factory',
        productURL:
            'https://media.blogto.com/listings/20171116-2048-CheesecakeFactory5.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70',
        imageURL:
            'https://media1.s-nbcnews.com/i/newscms/2019_12/1418790/the-cheese-cake-factory-today-main-190319_ef3be24e55155e25e28e5615f95d1f65.jpg'),
    Restaurant(
        name: 'Olive Garden',
        productURL:
            'https://www.ocregister.com/wp-content/uploads/2019/04/OCR-L-DEALS-0408-1.jpg',
        imageURL:
            'https://media3.s-nbcnews.com/i/newscms/2020_13/1551331/olive-garden-buy-one-take-one-to-go-today-main-200323_dd7452ab374aa7128638769c1e118219.jpg'),
    Restaurant(
        name: 'Panda Express',
        productURL:
            'https://www.tasteofhome.com/wp-content/uploads/2018/11/PX_OrangeChicken_FriedRice_Bowl.jpg',
        imageURL:
            'https://images.squarespace-cdn.com/content/v1/552675e5e4b00cfda38f0d0f/1573773683669-EJJKQNACHOU1R589CRN1/ke17ZwdGBToddI8pDm48kGDpvalPb1SqHoCn1hwN0Y57gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmx-YtV7KdJhhcFMxgH7DNwVWsr4BytTuzU0mdZNjZkC7ehjA8nxqmKGxR1QtMJl5J/Panda_Express_logo.png'),
  ];
  List<Restaurant> data_restaurant_List = [
    Restaurant(
        name: 'McDonald\'s',
        productURL:
            'https://assets.entrepreneur.com/content/3x2/2000/20190620160543-mcdonalds-vegan-burger.jpeg',
        imageURL:
            'https://geekzilla.tech/home/wp-content/uploads/2020/07/shutterstock_1181606473-1200x800-1.jpg'),
    Restaurant(
        name: 'Cheesecake Factory',
        productURL:
            'https://media.blogto.com/listings/20171116-2048-CheesecakeFactory5.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70',
        imageURL:
            'https://media1.s-nbcnews.com/i/newscms/2019_12/1418790/the-cheese-cake-factory-today-main-190319_ef3be24e55155e25e28e5615f95d1f65.jpg'),
    Restaurant(
        name: 'Olive Garden',
        productURL:
            'https://www.ocregister.com/wp-content/uploads/2019/04/OCR-L-DEALS-0408-1.jpg',
        imageURL:
            'https://media3.s-nbcnews.com/i/newscms/2020_13/1551331/olive-garden-buy-one-take-one-to-go-today-main-200323_dd7452ab374aa7128638769c1e118219.jpg'),
    Restaurant(
        name: 'Panda Express',
        productURL:
            'https://www.tasteofhome.com/wp-content/uploads/2018/11/PX_OrangeChicken_FriedRice_Bowl.jpg',
        imageURL:
            'https://images.squarespace-cdn.com/content/v1/552675e5e4b00cfda38f0d0f/1573773683669-EJJKQNACHOU1R589CRN1/ke17ZwdGBToddI8pDm48kGDpvalPb1SqHoCn1hwN0Y57gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QHyNOqBUUEtDDsRWrJLTmx-YtV7KdJhhcFMxgH7DNwVWsr4BytTuzU0mdZNjZkC7ehjA8nxqmKGxR1QtMJl5J/Panda_Express_logo.png'),
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: mediaQuery.size.height * 0.15,
              child: DrawerHeader(
                child: Center(
                  child: Text(
                    'Options',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('My Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Sign Out'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: FittedBox(
          child: const Text('Food Waste'),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () {}),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            height: 20,
            width: 50,
            child: Image.network(ncrURL, fit: BoxFit.cover),
          )
        ],
      ),
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
                Text('$_points' + ' pts'),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration:
                  InputDecoration(hintText: 'Search your restaurant here'),
              onChanged: (searchQuery) {
                setState(
                  () {
                    displayRestaurantList.clear();
                    if (searchQuery == '') {
                      displayRestaurantList.addAll(data_restaurant_List);
                    } else {
                      data_restaurant_List.forEach((restaurant) {
                        if (restaurant.name
                            .toLowerCase()
                            .startsWith(searchQuery.toLowerCase())) {
                          displayRestaurantList.add(restaurant);
                        }
                      });
                    }
                  },
                );
              },
            ),
            color: Colors.grey.withOpacity(0.3),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: displayRestaurantList.length,
              itemBuilder: (ctx, index) {
                return RestaurantCard(displayRestaurantList[index]);
              },
              // GridView.builder(
              //   itemCount: restaurant_List.length,
              //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //       maxCrossAxisExtent: 300,
              //       crossAxisSpacing: 20,
              //       mainAxisSpacing: 10,
              //       childAspectRatio: 1),
              //   itemBuilder: (ctx, index) {
              //     return RestaurantCard(restaurant_List[index]);
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
