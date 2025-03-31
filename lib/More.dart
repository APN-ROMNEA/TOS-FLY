import 'package:final_project/Bookflight.dart';
import 'package:flutter/material.dart';
import 'package:final_project/HomePage.dart';
import 'package:final_project/Mytrip.dart';
import 'package:final_project/profile.dart';


class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  int currentpage = 3;
  void selectedthing(int index) {
    if (index == currentpage) return;

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bookflight()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Mytrip()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MorePage()));
        break;
    }
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            backgroundColor: Colors.grey[400],

            leading: Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 0.0),
              child: IconButton(
                icon: const Icon(Icons.account_circle, size: 30),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
            ),
            title: const Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: Center(
                child: Text(
                  'តោះហោះ',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Moulpali',
                  ),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:25.0 ,right: 20.0),
                child: Icon(Icons.notifications_sharp,
                  size: 30,),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person, size: 40),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'example00@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  _buildListTile(Icons.lock, 'Change Password', () {}),
                  _buildListTile(Icons.language, 'Language', () {}),
                  _buildListTile(Icons.help, 'FAQ', () {}),
                  _buildListTile(Icons.feedback, 'Feedback', () {}),
                  _buildListTile(Icons.contact_mail, 'Contact Us', () {}),
                  _buildListTile(Icons.description, 'General Conditions of Carriage', () {}),
                  _buildListTile(Icons.settings, 'Preferences', () {}),
                  _buildListTile(Icons.logout, 'Log Out', () {}),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('version 1.0.0', style: TextStyle(fontSize: 12)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Privacy Policy and User Agreement',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),



        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            backgroundColor: Colors.grey[400],
            type: BottomNavigationBarType.fixed,
            currentIndex: currentpage,
            onTap: selectedthing,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 40 , color: Colors.black,), label: 'Home',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.flight_takeoff_outlined, size: 40,), label: 'BOOK FLIGHT'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.luggage, size: 40,), label: 'MY TRIPS'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_sharp, size: 40, color:Colors.blue),   label: 'MORE'),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontSize: 13),
            unselectedLabelStyle: TextStyle(fontSize: 10),

          ),
        ),
      );
    }
  }

ListTile _buildListTile(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    trailing: const Icon(Icons.arrow_forward_ios),
    onTap: onTap,
  );
}