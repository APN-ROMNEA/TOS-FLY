import 'package:final_project/Bookflight.dart';
import 'package:final_project/More.dart';
import 'package:final_project/Ticket.dart';
import 'package:flutter/material.dart';
import 'package:final_project/HomePage.dart';
import 'package:final_project/profile.dart';
import 'package:final_project/Notification.dart';




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
  final List<Map<String, String>> numofcard = [
    {
      "source": "PHNOM PENH",
      "destination": "JAPAN",
      "date": "02 February 2025",
      "airport": "Phnom Penh International Airport",
      "image": "https://media.connections.be/image/upload/c_fill,g_auto,q_auto:best,w_3840,f_auto//v1652357449/Destinations/Asia/Japan/TOURS/Discover%20Tokyo/Header_Fujiyoshida.jpg"
    },
    {
      "source": "PHNOM PENH",
      "destination": "BANGKOK",
      "date": "31 December 2024",
      "airport": "Phnom Penh International Airport",
      "image": "https://images.unsplash.com/photo-1508009603885-50cf7c579365?q=80&w=1950&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "source": "SIEM REAP",
      "destination": "ROME",
      "date": "20 November 2024",
      "airport": "Siem Reap Airport",
      "image": "https://images.unsplash.com/photo-1588614959060-4d144f28b207?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDd8fHJvbWV8ZW58MHx8MHx8fDA%3D"
    }
  ];
  int currentpage = 2;
  void selectedthing(int index) {
    if (index == currentpage) return;

    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Bookflight()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Mytrip()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MorePage()));
        break;
    }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0.0),
            child: IconButton(
              icon: const Icon(Icons.account_circle, size: 30),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Center(
              child: Text(
                'តោះហោះ',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Moulpali',
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0, right: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
                child: const Icon(Icons.notifications_sharp, size: 30),
              ),
            ),
          ],
        ),
      ),

        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                boxShadow:[ BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 3)
                  ),
                ],

              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
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
                    Padding(padding: EdgeInsets.all(8.0),
                    child: ListView(
                      children:[
                      InkWell(
                          onTap: (){
                          print('You Click ME!');
                          Navigator.push(
                          context,
                          MaterialPageRoute(

                          builder: (context) => Ticket()

                          )
                          );
                          },

                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),

                                ),
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1508009603885-50cf7c579365?q=80&w=1950&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                  height: 160, // Adjust image height
                                  width: double.infinity,
                                  fit: BoxFit.cover,

                                ),
                              ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                    ),
                                    border: Border.all(color: Colors.transparent),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("PHNOM PENH", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, letterSpacing: 1, fontFamily: 'Akshar'), ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                            child: Icon(Icons.arrow_forward, size: 18),
                                          ), // Arrow icon
                                          Text("BANGKOK", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, letterSpacing: 1, fontFamily: 'Akshar')),
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "14 February 2025  ·Phnom Penh International Airport",
                                        style: TextStyle(color: Colors.black, fontSize: 8),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                          ),
                        ),
                      ),
                      ],
                    ),
                    ),

                  Center(
                      child: Padding(padding: EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: numofcard.length,
                          itemBuilder:(context, index) {
                            var item = numofcard[index];
                            return Card(
                               shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                elevation: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),

                                      ),
                                      child: Image.network(
                                        item["image"]!,
                                        height: 160, // Adjust image height
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                        border: Border.all(
                                            color: Colors.transparent),
                                      ),
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(item["source"]!,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontSize: 12,
                                                      letterSpacing: 1,
                                                      fontFamily: 'Akshar')),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12.0, right: 12.0),
                                                child: Icon(Icons.arrow_forward,
                                                    size: 18),
                                              ), // Arrow icon
                                              Text(item["destination"]!, style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  letterSpacing: 1,
                                                  fontFamily: 'Akshar')),
                                            ],
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                              "${item["date"]} · ${item["airport"]}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          }
                        ),

                      ),


                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 100,
          child: BottomNavigationBar(
            backgroundColor: Colors.grey[400],
            type: BottomNavigationBarType.fixed,
            currentIndex: currentpage,
            onTap: selectedthing,
              items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 40 , color: Colors.black,), label: 'Home',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.flight_takeoff_outlined, size: 40,), label: 'BOOK FLIGHT'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.luggage, size: 40, color: Colors.blue,), label: 'MY TRIPS'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz_sharp, size: 40,),   label: 'MORE'),
            ],
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontSize: 13),
            unselectedLabelStyle: TextStyle(fontSize: 10),

          ),
        ),
      );
  }
}






