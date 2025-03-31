import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Transparent to show background
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black87),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Center(
              child: Text(
                'NOTIFICATIONS',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 0.0, right: 25.0),
              child: Icon(Icons.notifications_active, size: 30, color: Colors.blue),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          /// 🔹 Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/StarterPage.jpg",
              fit: BoxFit.cover,
            ),
          ),

          /// 🔹 Notification List
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                NotificationCard(
                  title: "Flight Reminder",
                  message: "Your flight to Tokyo is scheduled for tomorrow at 10:00 AM.",
                  time: "2h ago",
                ),
                NotificationCard(
                  title: "Exclusive Offer!",
                  message: "Get 20% off your next trip! Limited time only.",
                  time: "5h ago",
                ),
                NotificationCard(
                  title: "New Destination Added",
                  message: "We’ve added new travel destinations! Check them out now.",
                  time: "1d ago",
                ),
                NotificationCard(
                  title: "Payment Received",
                  message: "Your payment for the flight ticket has been processed successfully.",
                  time: "2d ago",
                ),
                NotificationCard(
                  title: "Payment Received",
                  message: "Your payment for the flight ticket has been processed successfully.",
                  time: "7d ago",
                ),
                NotificationCard(
                  title: "Payment Received",
                  message: "Your payment for the flight ticket has been processed successfully.",
                  time: "7d ago",
                ),
                NotificationCard(
                  title: "Payment Received",
                  message: "Your payment for the flight ticket has been processed successfully.",
                  time: "7d ago",
                ),
                NotificationCard(
                  title: "Payment Received",
                  message: "Your payment for the flight ticket has been processed successfully.",
                  time: "7d ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              message,
              style: const TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
