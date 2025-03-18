import 'package:flutter/material.dart';

class Bookflight extends StatefulWidget {
  const Bookflight({super.key});

  @override
  State<Bookflight> createState() => _BookflightState();
}

class _BookflightState extends State<Bookflight> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Akshar'
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(

            leading:
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 25.0),
              child: Icon(Icons.account_circle,
                size: 30,),
            ),
            title: Center
              (child:
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text('TOS-FLY',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: 'Akshar',

                ),
              ),
            ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top:25.0 ,right: 20.0),
                child: Icon(Icons.notifications_sharp,
                  size: 30,),
              )
            ],
          ),
        ),


        bottomNavigationBar: Container(
          height: 100,
          child: BottomNavigationBar(
            backgroundColor: Colors.grey[400],
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                backgroundColor: Colors.blueAccent,
                icon: Icon(Icons.home, size: 40 , color: Colors.black,), label: 'Home',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.flight_takeoff_outlined, size: 40,), label: 'BOOK FLIGHT'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.luggage, size: 40,), label: 'MY TRIPS'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_sharp, size: 40,), label: 'MORE'),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontSize: 13),
            unselectedLabelStyle: TextStyle(fontSize: 10),

          ),
        ),
      ),
    );
  }
}
