import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFD9D9D9) ,
          title: Center(
            child: const Text('WELCOME',
              style: TextStyle(
                fontFamily: 'Akshar',
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 2.0,
                color: Colors.black,

              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/StarterPage.jpg"),
              fit: BoxFit.cover, // Ensures the image covers the screen
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(60.0),
          child: SizedBox(
            width: 200,
            height: 40,
            child: FloatingActionButton(
              onPressed: (){
              print('You Click ME!');
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder( // Makes it rectangular instead of circular
                borderRadius: BorderRadius.circular(20.0),
              ),
                child: Text('Continue',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontFamily: 'Inter',
                  fontSize: 15.0,
                ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}



