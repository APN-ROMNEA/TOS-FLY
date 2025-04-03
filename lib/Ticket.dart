import 'package:flutter/material.dart';


class Ticket extends StatelessWidget {
  const Ticket({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(

            leading:
            Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 25.0),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                    icon: Icon(Icons.arrow_back_ios_new))
            ),
            title: Center
              (child:
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 60),
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
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("DEPARTURE", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Color(0xFF014E81))),
                      SizedBox(height: 4),
                      Text("6:00", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Color(0xFF014E81))),
                      Text("Scheduled 14 Feb - 6:00AM", style: TextStyle(fontSize: 12, color: Color(0xFF014E81))),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("ARRIVAL", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF014E81))),
                      SizedBox(height: 4),
                      Text("1:30", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
                      Text("Scheduled 14 Feb - 15:30PM", style: TextStyle(fontSize: 12, color: Color(0xFF014E81))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Phnom Penh International\nAirport", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF014E81))),
                  Text("          Suvarnabhumi\nInternational Airport", style: TextStyle(fontSize: 12 , fontWeight: FontWeight.bold, color: Color(0xFF014E81))),
                ],
              ),
            ),
          ],
        ),
      );
  }
}