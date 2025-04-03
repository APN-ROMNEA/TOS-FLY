import 'package:final_project/HomePage.dart';
import 'package:final_project/Sign-in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:final_project/utilities/users_service.dart';


final TextEditingController emailController = TextEditingController();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? errorMessage;
  bool ischecked = false ;


  void setErrorMessage(String? message) {
    setState(() {
      errorMessage = message;
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
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        buildTextField("Email", Icons.email_outlined, emailController),
                        const SizedBox(height: 15),
                        buildTextField("Username", Icons.person, usernameController),
                        const SizedBox(height: 15),
                        PhoneNumberField(),
                        const SizedBox(height: 15),
                        PasswordTextField(),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Checkbox(value: ischecked, onChanged: (bool ? newValue){
                                setState(() {
                                  ischecked = newValue!;
                                });
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('By creating an account, you agree to our',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                  ),
                                  Text('Term & Conditions',
                                    style: TextStyle(
                                        color: Colors.blue[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                            onPressed: () {
                              String email = emailController.text;
                              String password = passwordController.text;
                              String username = usernameController.text;
                              String phone = phoneController.text;

                              handleRegister(
                                email,
                                password,
                                username,
                                phone,
                                    (message) {
                                  setState(() {
                                    errorMessage = message == "success" ? null : message;
                                  });
                                  print("Error message: $errorMessage");

                                  if (message == "success") {
                                    emailController.clear();
                                    passwordController.clear();
                                    usernameController.clear();
                                    phoneController.clear();

                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Sign_in()),
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

                            child: const Text(
                              "CONTINUE →",
                              style: TextStyle(color: Colors.white, fontSize: 16),
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
                            _socialButton(FontAwesomeIcons.facebook, Colors.blue),
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
                              const Text("Already have an account? ", style: TextStyle(color: Colors.black)),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the Sign Up screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Sign_in()),
                                  );
                                },
                                child: const Text(
                                  "SIGN IN",
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

  Widget buildTextField(String label, IconData icon, TextEditingController controller) {
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

class PhoneNumberField extends StatefulWidget {
  @override
  _PhoneNumberFieldState createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String selectedCountryCode = "+855";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Phone Number", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
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
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    selectedCountryCode = country.dialCode!;
                  });
                },
                initialSelection: "KH",
                favorite: ["+855", "KH"],
                showFlagMain: true,
                alignLeft: false,
              ),
              suffixIcon: const Icon(Icons.phone),
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
                offset: const Offset(0, 2 ),
                spreadRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            obscureText: _isObscure,
            controller: passwordController,
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

Widget _socialButton(IconData icon, Color color) {
  return InkWell(
    onTap: () {},
    child: Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 12,
            offset: const Offset(0, 2 ),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Icon(icon, color: color, size: 30),
      ),
    ),
  );
}

void handleRegister(
    String email,
    String password,
    String username,
    String phone_number,
    Function(String?) setErrorMessage,
    ) async {
  setErrorMessage(null);

  if (email.isEmpty) {
    setErrorMessage("Email is required.");
    return;
  }
  if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
    setErrorMessage("Invalid email.");
    return;
  }

  if (username.isEmpty) {
    setErrorMessage("Username is required.");
    return;
  }

  if (phone_number.isEmpty || phone_number.length <= 8) {
    setErrorMessage("Phone number must be more than 8 characters.");
    return;
  }

  if (password.isEmpty || password.length < 8) {
    setErrorMessage("Password must be at least 8 characters.");
    return;
  }

  try {
    var existingUser = await UsersService.instance.checkEmail(email);
    if (existingUser != null) {
      setErrorMessage("Email already exists.");
      return;
    }

    Map<String, dynamic> userData = {
      "email": email,
      "password": password,
      "username": username,
      "phone_number": phone_number,
    };

    var result = await UsersService.instance.createUser(userData);

    if (result != null) {
      setErrorMessage("success");
    } else {
      setErrorMessage("Registration failed.");
    }
  } catch (e) {
    setErrorMessage("Error: $e");
  }
}