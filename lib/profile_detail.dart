import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('កំណត់'),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.red,
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(width: 16),
                Text(
                  'example00@gmail.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Divider(),
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
                Text('version 1.0.0', style: TextStyle(fontSize: 12)),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Privacy Policy and User Agreement',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'BOOK FLIGHT'),
          BottomNavigationBarItem(icon: Icon(Icons.trip_origin), label: 'MY TRIPS'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MORE'),
        ],
      ),
    );
  }

  ListTile _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}