import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_app_clone/widgets/travels_bar_selector.dart';

void main() {
  runApp(const MyApp());
}

var travelsLocations = [
  'Mountains',
  'Lakes',
  'Beaches',
  'Forests',
  'Hostels',
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App - clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  String mountainLink =
      'https://images.unsplash.com/photo-1552845108-5f775a2ccb9b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=871&q=80';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _appBar(width),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: TravelsBarSelector(travelsLocations: travelsLocations)),
          Card(
            elevation: .15,
            margin: const EdgeInsets.all(20),
            shadowColor: Colors.black,
            borderOnForeground: true,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(26),
                ),
                color: Colors.grey,
              ),
              height: 260,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(26),
                      ),
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          mountainLink,
                        ),
                      ),
                    ),
                    height: 175,
                  ),
                  const ListTile(
                    title: Text("Blue Mountains"),
                    subtitle: Text('Mountains'),
                    tileColor: Colors.white,
                    autofocus: true,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: .7,
          showSelectedLabels: false,
          fixedColor: Colors.grey[400],
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  color: Colors.grey[400],
                ),
                label: 'Home',
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.compass_calibration,
                color: Colors.grey[400],
              ),
              label: 'Locate',
              backgroundColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

_appBar(width) {
  String profileImage =
      'https://media-exp1.licdn.com/dms/image/C4E03AQE3K-yEAP26Dw/profile-displayphoto-shrink_800_800/0/1593484022376?e=1640217600&v=beta&t=H4gGEMC25gLamS1bPEcbt6-HqUnh2d-5OD8V42922y8';

  return PreferredSize(
    child: CustomScrollView(
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: const EdgeInsets.only(top: 35, left: 15),
            title: SizedBox(
              width: width * 0.5,
              child: Text.rich(
                TextSpan(
                  text: 'Find places for your best ',
                  style: const TextStyle(
                    letterSpacing: 0.001,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(
                      text: 'travel',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            width: width * 0.5,
                            child: const TextField(
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 1,
                              cursorColor: Colors.orange,
                              decoration: InputDecoration(
                                hintText: 'Found place...',
                                hintStyle: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                                border: InputBorder.none,
                                suffix: Icon(
                                  Icons.search_outlined,
                                  color: Colors.orange,
                                  size: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          expandedHeight: 200.0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    profileImage,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: Text.rich(
                  TextSpan(
                    text: 'Hi, ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Nathan!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
          floating: true,
        ),
      ],
    ),
    preferredSize: const Size.fromHeight(200),
  );
}
