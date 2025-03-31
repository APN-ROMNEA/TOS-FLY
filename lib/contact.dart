import 'package:final_project/tripsum.dart';
import 'package:flutter/material.dart';

class PassengerInfoScreen extends StatefulWidget {
  @override
  State<PassengerInfoScreen> createState() => _PassengerInfoScreenState();
}

class _PassengerInfoScreenState extends State<PassengerInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Passengers Info",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.blue.shade700, // Set the background color here
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  // Flight Route Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("PNH",
                                  style: _flightTextStyle()
                                      .copyWith(fontSize: 42)),
                              Text("Phnom Penh",
                                  style:
                                      _smallTextStyle().copyWith(fontSize: 20)),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Icon(
                            Icons.flight_land_outlined,
                            color: Colors.white,
                            size: 42,
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        children: [
                          Text("BKK",
                              style: _flightTextStyle().copyWith(fontSize: 42)),
                          Text("Bangkok",
                              style: _smallTextStyle().copyWith(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Passenger Add Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  "ADT",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                "Click To Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 24),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),


                  const SizedBox(height: 30),

                  // Contact Information Form
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Passport Information",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(height: 15),
                          _customTextField("Surname"),
                          const SizedBox(height: 15),
                          _customTextField("Given name"),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(child: _customTextField("N")),
                              const SizedBox(width: 15),
                              Expanded(
                                  flex: 2,
                                  child: _customTextField("Passport No.")),
                            ],
                          ),
                          const SizedBox(height: 15),
                          _customTextField("DOB"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Next Button
            Container(
              width: double.infinity,
              color: Colors.blue.shade900,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: TextButton(
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>TripSummaryPage()));
                  },
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  TextStyle _flightTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold);
  }

  TextStyle _smallTextStyle() {
    return TextStyle(color: Colors.white, fontSize: 14);
  }

  Widget _customTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue.shade800,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
