import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/utilities/users_service.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String? _profileImagePath;
  late Future<dynamic> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = _loadUser();
  }

  Future<dynamic> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId == null) {
      throw Exception("No user is logged in");
    }
    return await UsersService.instance.getUserById(userId);
  }


  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery);
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
        title: const Text('តោះហោះ', style: TextStyle(fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Moulpali',)),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 0.0),
          child: IconButton(
            icon: const Icon(
                Icons.arrow_back_ios, size: 30, color: Colors.black87),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("No user data available"));
          } else {
            final user = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImagePath != null
                        ? FileImage(File(_profileImagePath!))
                        : AssetImage(
                        'assets/profile_picture.png') as ImageProvider,
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
                  buildProfileInfoRow('Username', user['username'] ?? ''),
                  SizedBox(height: 10),
                  buildProfileInfoRow('Email', user['email'] ?? ''),
                  SizedBox(height: 10),
                  buildProfileInfoRow('Phone Number', '0${user['phone_number'] ?? ''}'),
                  SizedBox(height: 10),
                  // Fixed value for "Joined" and "Region"
                  buildProfileInfoRow('Joined', '13-Nov-2024'),
                  SizedBox(height: 10),
                  buildProfileInfoRow('Region', 'Cambodia'),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(value.isNotEmpty ? value : 'N/A'),
        ],
      ),
    );
  }
}