  // TODO-2: Import http and dart:convert
  import 'package:http/http.dart';
  import 'dart:convert';

  class UsersService {
    static final UsersService _singleton = UsersService._internal();

    UsersService._internal();

    static UsersService get instance => _singleton;

    // TODO-3: Add base URL
    final String baseurl = 'https://67e2555097fc65f5353580b2.mockapi.io/user';

    Future<List<dynamic>> getUsers() async {
      // TODO-4: Fetch all users
      Response res = await get(Uri.parse('$baseurl'));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      else {
        throw "Unable to retrieve contacts";
      }
    }

    Future<dynamic> updateUser(String id, Map<String, dynamic> data) async {
      // TODO-5: Update a user
      Response res = await patch(Uri.parse('$baseurl/$id'));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      else {
        throw "Unable to retrieve contacts";
      }
    }

    Future<dynamic> createUser(Map<String, dynamic> data) async {
      try {
        Response res = await post(
          Uri.parse(baseurl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(data),
        );

        print("Response status: ${res.statusCode}");
        print("Response body: ${res.body}");

        if (res.statusCode == 201) {
          return jsonDecode(res.body); // Return the created user data if successful
        } else {
          throw Exception('Failed to create user: ${res.statusCode} - ${res.body}');
        }
      } catch (e) {
        print("Error: ${e.toString()}");
        throw Exception("Error occurred while creating user: ${e.toString()}");
      }
    }
    Future<dynamic> deleteUser(String id) async {
      // TODO-7: Delete a user
      Response res = await delete(Uri.parse('$baseurl/$id'));
      if (res.statusCode == 200) {
        return jsonDecode(res.body);
      }
      else {
        throw "Unable to retrieve contacts";
      }
    }
    Future<Map<String, dynamic>?> updateUserProfile(String id, Map<String, dynamic> data) async {
      try {
        Response res = await patch(
          Uri.parse('$baseurl/$id'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (res.statusCode == 200) {
          return jsonDecode(res.body);
        } else {
          throw "Unable to update user data. Error: ${res.statusCode}";
        }
      } catch (e) {
        throw "Error: $e";
      }
    }
    Future<dynamic> getUserById(String id) async {
      try {
        final response = await get(Uri.parse('$baseurl/$id'));

        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          throw Exception("Unable to retrieve user");
        }
      } catch (e) {
        throw Exception("Error fetching user by ID: $e");
      }
    }
    Future<dynamic> checkEmail(String email) async {
      try {
        final users = await getUsers();
        final user = users.firstWhere(
              (user) => user['email'] == email,
          orElse: () => null,
        );
        return user;
      } catch (e) {
        throw "Error checking email: $e";
      }
    }

  }

