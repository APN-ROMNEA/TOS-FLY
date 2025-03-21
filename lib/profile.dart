import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String? _profileImagePath;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
              backgroundImage: _profileImagePath != null
                  ? FileImage(File(_profileImagePath!))
                  : AssetImage('assets/profile_picture.png') as ImageProvider,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.blue),
                  onPressed: _pickImage,
                ),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: _pickImage,
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
