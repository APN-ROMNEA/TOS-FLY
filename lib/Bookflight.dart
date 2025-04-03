import 'package:final_project/profile.dart';
import 'package:flutter/material.dart';
import 'package:final_project/More.dart';
import 'package:final_project/HomePage.dart';
import 'package:final_project/Mytrip.dart';
import 'package:final_project/Notification.dart';
import 'package:final_project/contact.dart';


class Bookflight extends StatefulWidget {
  const Bookflight({super.key});

  @override
  State<Bookflight> createState() => _BookflightState();
}

class _BookflightState extends State<Bookflight> {
  bool isOneWay = true;
  DateTime? startDate;
  DateTime? endDate;
  String from = 'Phnom Penh';
  String to = 'Bangkok';
  String selectedClass = 'Economy Class, 1 Adult, 0 Child, 0 Infant';
  bool isFormValid() {
    return from.isNotEmpty &&
        to.isNotEmpty &&
        startDate != null &&
        selectedClass.isNotEmpty &&
        (isOneWay || endDate != null);  //
  }
  // List of available locations
  final List<String> locations = [
    'Phnom Penh',
    'Bangkok',
    'Singapore',
    'Kuala Lumpur',
    'Ho Chi Minh City',
    'Jakarta',
  ];


  final List<String> airplaneClasses = [
    'Economy Class, 1 Adult, 0 Child, 0 Infant',
    'Business Class, 1 Adult, 0 Child, 0 Infant',
    'First Class, 1 Adult, 0 Child, 0 Infant',
  ];

  // Function to show location selection dialog
  Future<void> _selectLocation(bool isFrom) async {
    final selectedLocation = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isFrom ? 'Select Departure' : 'Select Arrival'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return ListTile(
                  title: Text(location),
                  onTap: () {
                    Navigator.pop(context, location);
                  },
                );
              },
            ),
          ),
        );
      },
    );

    if (selectedLocation != null) {
      setState(() {
        if (isFrom) {
          from = selectedLocation;
        } else {
          to = selectedLocation;
        }
      });
    }

  }
  int currentpage = 1;
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
        backgroundColor: Color(0xFF0073B1),
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

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Map Container
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.network(
                      'https://plus.unsplash.com/premium_photo-1682310071124-33632135b2ee?q=80&w=2112&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text(
                            'Map not available',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // One Way / Return Toggle
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isOneWay = true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isOneWay ? Colors.blue[900] : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "One Way",
                                style: TextStyle(
                                  color: isOneWay ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => isOneWay = false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isOneWay ? Colors.white : Colors.blue[900],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Return",
                                style: TextStyle(
                                  color: isOneWay ? Colors.black : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // From - To Fields
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => _selectLocation(true),
                            child: Text(
                              " $from",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                final temp = from;
                                from = to;
                                to = temp;
                              });
                            },
                            child: const Icon(
                              Icons.swap_horiz,
                              color: Colors.white,
                              size: 48.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _selectLocation(false),
                            child: Text(
                              " $to",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Select Departure",
                              style: TextStyle(color: Colors.grey)),
                          Text("Select Arrival",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Date Picker
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        startDate == null
                            ? "Select date"
                            : "${startDate!.toLocal()}".split(' ')[0],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTimeRange? picked = await showDateRangePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );
                          if (picked != null) {
                            setState(() {
                              startDate = picked.start;
                              endDate = picked.end;
                            });
                          }
                        },
                        child:
                        const Icon(Icons.calendar_today, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          selectedClass,
                          style: const TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                      const SizedBox(
                          width:
                          10),
                      DropdownButton<String>(
                        value: selectedClass,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey), // Dropdown icon
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.grey),
                        underline: Container(
                          height: 2,
                          color: Colors.transparent, // Hide the underline
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedClass = newValue!;
                          });
                        },
                        items: airplaneClasses
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Find Flight Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFormValid() ? Colors.blue[900] : Colors.grey,                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(double.infinity, 60),
                    ),
                    onPressed:isFormValid()
                        ? () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const BookingFoundScreen())));
                    }: null,
                    child: const Text(
                      "Find Flight",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                icon: Icon(Icons.home, size: 40 ,), label: 'Home',),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.flight_takeoff_outlined, size: 40, color: Colors.blue,), label: 'BOOK FLIGHT'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.luggage, size: 40,), label: 'MY TRIPS'),
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


// PICK FLIGHT SCREEN

class BookingFoundScreen extends StatelessWidget {
  const BookingFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('តោះហោះ', style: TextStyle(fontSize: 20, fontFamily: 'Moulpali', fontWeight: FontWeight.bold) ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue[900],
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Choose flight',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return FlightCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FlightCard extends StatelessWidget {
  const FlightCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      color: Colors.blue[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Departure Time',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(
                    'Seats',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    'Duration',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
                Text(
                  '\$168.00',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 12), // Increased spacing

            // Details Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '06:00 AM',
                  style: TextStyle(
                      fontSize: 12, // Larger font size for emphasis
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25), // Modified margin right
                  padding: EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4), // Smaller padding
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '120/149',
                    style: TextStyle(
                        fontSize: 12, // Smaller font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Text(
                  '7h 30m',
                  style: TextStyle(
                      fontSize: 12, // Larger font size for emphasis
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => const SeatSelectionScreen())));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        elevation: 8, // Adds shadow effect
                        shadowColor: Colors.black,
                        padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      child: Text(
                        'Bookings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12), // Increased spacing

            // Footer Row (Airplane Icon and Model)
            Row(
              children: [
                Icon(
                  Icons.airplanemode_active,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'Boeing 737-700 149 seats',
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




//CHOOSE SEAT SCREEN

class StatusIndicator extends StatelessWidget {
  final Color color;
  final String label;

  const StatusIndicator({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  SeatSelectionScreenState createState() => SeatSelectionScreenState();
}

class SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final int rows = 10;
  final int cols = 6;
  final List<List<bool>> seatStatus = [
    [true, true, false, true, true, false],
    [false, false, false, false, false, false],
    [true, true, false, true, true, false],
    [false, false, false, false, false, false],
    [true, true, false, true, true, false],
    [false, false, false, false, false, false],
    [true, true, false, true, true, false],
    [false, false, false, false, false, false],
    [true, true, false, true, true, false],
    [false, false, false, false, false, false],
  ];

  final List<List<bool>> selectedSeats =
  List.generate(10, (row) => List.filled(6, false));

  void toggleSeatSelection(int row, int col) {
    if (!seatStatus[row][col]) {
      setState(() {
        selectedSeats[row][col] = !selectedSeats[row][col];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'តោះហោះ',
          style: TextStyle(color: Colors.black,
              fontSize: 18,
              fontFamily: 'Moulpali',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Choose seat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                // Circle for status indicators
                SizedBox(
                  width: 380,
                  height: 354,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Status indicators (Taken, Available)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              StatusIndicator(
                                  color: Colors.black, label: "Taken"),
                              StatusIndicator(
                                  color: Colors.blue, label: "Available"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: ['A', 'B', 'C', 'D', 'E', 'F']
                                .map((label) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.5),
                                  child: Text(
                                    label,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ))
                                .toList(),
                          ),
                          const SizedBox(height: 170),
                        ],
                      ),
                    ),
                  ),
                ),

                // Rectangle containing seats and button
                Positioned(
                  top: 140,
                  child: Container(
                    width: 355,
                    height: 600,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        // Seat grid
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: GridView.builder(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemCount: rows * cols,
                              itemBuilder: (context, index) {
                                final row = index ~/ cols;
                                final col = index % cols;
                                final isTaken = seatStatus[row][col];
                                final isSelected = selectedSeats[row][col];

                                return Container(
                                  decoration: BoxDecoration(
                                    color: isTaken
                                        ? Colors.black
                                        : isSelected
                                        ? Colors.blue
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: GestureDetector(
                                    onTap:(){
                                      Navigator.push(
                                          context, MaterialPageRoute(builder: (context) =>PassengerInfoScreen()));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}