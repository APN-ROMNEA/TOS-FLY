import 'package:flutter/material.dart';


class Mytrip extends StatefulWidget {
  const Mytrip({super.key});

  @override
  State<Mytrip> createState() => _MytripState();

}


class _MytripState extends State<Mytrip>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
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

        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                boxShadow:[ BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 3)
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow:[ BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3)
                    ),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "UPCOMING TRIP"),
                    Tab(text: "PAST TRIP"),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(padding: EdgeInsets.all(2.0),
                  child: GridView.count(
                      crossAxisCount: 1,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 2,
                    children: [
                      Container(
                      width: double.infinity,
                        height: 1000,
                        color: Colors.black,

                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.black,
                      ),
                      Container(
                        width: 100,
                        height: 50,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  ),
                  Center(child: Text("Past Trips", style: TextStyle(fontSize: 12))),
                ],
              ),
            ),
          ],
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

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(

            leading:
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 25.0),
              child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_new))
            ),
            title: Center
              (child:
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 60),
              child: Text('TOS-FLY',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontFamily: 'Akshar',
                ),
              ),
            ),
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [BoxShadow(
                  blurRadius: 10,
                )]
              ),
              child: Image.asset("assets/images/airport.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_rounded, size: 16,),
                        SizedBox(width: 5),
                        Text('Today', style: TextStyle(fontFamily: "Inter",fontSize: 15),)
                      ],
                    ),
                )
                )
        ],
    ),

            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: Text('14 Feb 2025',
                    style: TextStyle(
                    fontWeight: FontWeight.bold
                    )
                  ),
                )
            ),
            Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
              color: Colors.blue[100],
             ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor:  Color(0xFF014E81),
                        child: Icon(Icons.airplanemode_on_outlined,color: Colors.white,),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("PNH", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Phnom Penh", style: TextStyle(fontSize: 14)),
                      Text("Bangkok Airways - BA810", style: TextStyle(fontSize: 10, color:  Color(0xFF014E81),fontWeight: FontWeight.bold)),
                    ],


                  ),
                  RotatedBox(quarterTurns: 1,child: Icon(Icons.airplanemode_active, size: 30)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF014E81),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('CHECK IN', style: TextStyle(fontFamily: "Inter",fontSize: 15, color: Colors.white),)
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("BKK", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("Bangkok", style: TextStyle(fontSize: 14)),
                    ],


                  )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}



