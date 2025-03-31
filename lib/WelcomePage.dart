import 'package:final_project/Sign-in.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 45),
            child: SizedBox(
              width: 250,
              height: 50,
              child: FloatingActionButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(

                      builder: (context) => Sign_in()

                  ),);
                },
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Continue',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontFamily: 'Inter',
                        fontSize: 15.0,
                      ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.arrow_forward_outlined)
                    ],
                  ),
              ),
            ),
          ),
        ),
      );
  }
}



