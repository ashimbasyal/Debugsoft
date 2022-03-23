import 'package:debugsoft/details.dart';
import 'package:debugsoft/feedback.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    var titleList = [
      'Deuba is in a tight spot',
      'Why Gagan Thapa’s ',
      'Nepali Congress race',
      'Government team to visit ',
      'Dashain ticket pre-booking',
      'Deuba is in a tight spot',
      'Why Gagan Thapa’s ',
      'Nepali Congress race',
      'Government team to visit ',
      'Dashain ticket pre-booking',
    ];
    var desclist = [
      'The prime minister appears to have fallen into a trap with coalition partners’ strong reservations about the American programme, as US officials are due to arrive this week.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
      'Traffic police to set up 14 help desks to tell inquirers bus fares to all the districts, distribute face masks and watch over-charging vehicles.',
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("example"),
              accountEmail: Text("example@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/en/8/86/Avatar_Aang.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                //feedback
                Route newRoute = MaterialPageRoute(builder: (_) => FeedBack());
                Navigator.pushReplacement(context, newRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: Text('LogOut'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: titleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Route newRoute =
                      MaterialPageRoute(builder: (context) => Detailspage());
                  Navigator.pushReplacement(context, newRoute);
                },
                child: SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  titleList[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    desclist[index],
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
