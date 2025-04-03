import 'package:final_project/More.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/utilities/users_service.dart';


class changepw extends StatefulWidget {
  const changepw({super.key});

  @override
  State<changepw> createState() => _changepwState();
}

class _changepwState extends State<changepw> {
  late Future<dynamic> _userFuture;
  late TextEditingController emailController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  String? errorMessage;
  void setErrorMessage(String? message) {
    setState(() {
      errorMessage = message;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _userFuture = _loadUser();
  }

  Future<void> _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId == null) {
      throw Exception("No user is logged in");
    }
    var user = await UsersService.instance.getUserById(userId);

    setState(() {
      usernameController.text = user['username'];
      emailController.text = user['email'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    "https://plus.unsplash.com/premium_photo-1661501359079-b362cda0d5d0?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG0dby1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, -80),
              child: Container(
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      buildTextField("Email", Icons.email_outlined, emailController),
                      SizedBox(height: 20),
                      buildTextField("Username", Icons.person, usernameController),
                      SizedBox(height: 20),
                      PasswordTextField(controller: passwordController),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password must contain more than 8 characters with UPPERCASE, and lowercase.', style: TextStyle(fontSize: 9, color: Colors.grey)),
                          SizedBox(height: 4),
                          Text('Password must contain atleast one number and symbol.', style: TextStyle(fontSize: 9, color: Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 20),
                      ConfirmPasswordTextField(controller: confirmPasswordController),
                      SizedBox(height: 20),
                      const SizedBox(height: 20),
                      if (errorMessage != null) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            errorMessage!,
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              await _loadUser();
                            } catch (e) {
                              setState(() {
                                errorMessage = "Failed to load user data: $e";
                              });
                              return;
                            }
                            String email = emailController.text;
                            String username = usernameController.text;
                            String newPassword = passwordController.text;
                            String confirmPassword = confirmPasswordController.text;

                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            String? userId = prefs.getString('userId');

                            if (userId == null || userId.isEmpty) {
                              setState(() {
                                errorMessage = "User ID is missing, please log in again.";
                              });
                              return;
                            }

                            handleChangeProfile(
                              newPassword,
                              confirmPassword,
                              email,
                              username,
                              userId,
                                  (message) {
                                setState(() {
                                  errorMessage = message == "success" ? null : message;
                                });

                                if (message == "success") {
                                  emailController.clear();
                                  passwordController.clear();
                                  usernameController.clear();
                                  confirmPasswordController.clear();

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => MorePage()),
                                  );
                                }
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("SAVE", style: TextStyle(color: Colors.white, fontSize: 16)),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon,TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12,
                offset: const Offset(0, 2 ),
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  PasswordTextField({required this.controller});
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12,
                offset: const Offset(0, 2 ),
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: _isObscure,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 1.5,
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ConfirmPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  ConfirmPasswordTextField({required this.controller});
  @override
  _ConfirmPasswordTextFieldState createState() => _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Confirm Password", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 12,
                offset: const Offset(0, 2),
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller,
            obscureText: _isObscure,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _socialButton(IconData icon, Color color) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12, width: 0.1),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(0, 6),
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    ),
  );
}

void handleChangeProfile(
    String newPassword,
    String confirmPassword,
    String email,
    String username,
    String userId,
    Function(String?) setErrorMessage,
    ) async {
  setErrorMessage(null);

  if (newPassword != confirmPassword) {
    setErrorMessage("Passwords do not match.");
    return;
  }

  if (newPassword.isEmpty || newPassword.length <= 8) {
    setErrorMessage("New password must be at least 8 characters.");
    return;
  }

  if (email.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
    setErrorMessage("Invalid email.");
    return;
  }

  if (username.isEmpty) {
    setErrorMessage("Username is required.");
    return;
  }

  try {
    var user = await UsersService.instance.getUserById(userId);
    if (user == null) {
      setErrorMessage("User not found.");
      return;
    }


    Map<String, dynamic> updatedData = {
      "email": email,
      "username": username,
      "password": newPassword,
    };

    var result = await UsersService.instance.updateUserProfile(userId, updatedData);

    if (result != null) {
      setErrorMessage("Profile updated successfully.");
    } else {
      setErrorMessage("Profile update failed.");
    }
  } catch (e) {
    setErrorMessage("Error: $e");
  }
}