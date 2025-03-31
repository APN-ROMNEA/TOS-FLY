import 'package:final_project/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:final_project/utilities/users_service.dart';
import 'package:final_project/Sign-up.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class Sign_in extends StatefulWidget {

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  final _formKey = GlobalKey<FormState>();

  String? _emailError;
  String? _errorMessage;
  int _attemptsLeft = 3;

  void decreaseAttempts() {
    setState(() {
      _attemptsLeft--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                            "SIGN IN",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        buildTextField("Email", Icons.email_outlined),
                        const SizedBox(height: 15),
                        PasswordTextField(),
                        const SizedBox(height: 10),
                        if (_errorMessage != null) ...[
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Icon(Icons.error, color: Colors.red),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    _errorMessage!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Max attempts : $_attemptsLeft",
                                style: TextStyle(fontSize: 12)),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Forget Password?",
                                  style: TextStyle(fontSize: 12)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _attemptsLeft > 0
                                ? () {
                              if (_formKey.currentState?.validate() ?? false) {
                                String email = emailController.text;
                                String password = passwordController.text;
                                handleLogin(email, password, context, (msg) {
                                  setState(() {
                                    _errorMessage = msg;
                                  });
                                }, decreaseAttempts);
                              }
                            } : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 5,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("LOGIN",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("or"),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(
                                FontAwesomeIcons.facebook, Colors.blue),
                            SizedBox(width: 10),
                            _socialButton(FontAwesomeIcons.apple, Colors.black),
                            SizedBox(width: 10),
                            _socialButton(FontAwesomeIcons.google, Colors.red),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account yet? ", style: TextStyle(color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the Sign Up screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                                  );
                                },
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline, // Underline added here
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 100),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text("Terms & Conditions",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 14)),
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

  Widget buildTextField(String label, IconData icon) {
    return Form(
      key: _formKey,
      child: Column(
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
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                      color: _emailError != null ? Colors.red : Colors.grey,
                      width: 1.5
                  ),
                ),
                errorText: _emailError,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
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
                offset: const Offset(0, 2),
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            controller: passwordController,
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
                borderSide: const BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
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
        border: Border.all(color: Colors.grey, width: 1.5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 2),
            color: Colors.grey,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 30),
    ),
  );
}


void handleLogin(
    String email, String password, BuildContext context, Function(String?) setErrorMessage, Function() decreaseAttempts) async {
  if (email.isEmpty || password.isEmpty) {
    setErrorMessage("Please fill in both fields.");
    return;
  }

  try {
    var user = await UsersService.instance.checkEmail(email);
    if (user != null) {
      if (user['password'] == password) {
        setErrorMessage(null);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      } else {
        setErrorMessage("Invalid password");
        decreaseAttempts();
      }
    } else {
      setErrorMessage("Invalid Email");
      decreaseAttempts();
    }
  } catch (e) {
    setErrorMessage("Error: ${e.toString()}");
  }
}