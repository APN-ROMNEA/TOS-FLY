import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ប្រវត្តិរូប'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.png'),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.blue),
                  onPressed: () {
                    // Handle change picture action
                  },
                ),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Handle change picture action
              },
              child: Text(
                'Change Picture',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 25),
            buildProfileInfoRow('Username', 'JoJoBa'),
            buildProfileInfoRow('Email', 'example00@gmail.com'),
            buildProfileInfoRow('Phone Number', '012-123-***'),
            buildProfileInfoRow('Joined', '13-Nov-2024'),
            buildProfileInfoRow('Region', 'Cambodia'),
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}