import 'package:final_project/Bookflight.dart';
import 'package:final_project/Ticket.dart';
import 'package:flutter/material.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Transform.translate(
          offset: const Offset(0, 14), // Move the close icon slightly down
          child: IconButton(
            icon:  Icon(Icons.close, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Bookflight()));
            },
          ),
        ),
        actions: [
          Transform.translate(
            offset: const Offset(0, 14), // Move the share icon slightly down
            child: IconButton(
              icon: const Icon(Icons.ios_share, color: Colors.white, size: 30),
              onPressed: () {
                // Share functionality
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // Add spacing at the top
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: CircleAvatar(
                    radius: 47,
                    backgroundColor: Colors.green.withOpacity(0.8),
                  ),
                ),
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.check,
                      color: Colors.lightGreenAccent, size: 50),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Thank you! You have completed your payment.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
                color: Colors.white, thickness: 1, indent: 40, endIndent: 40),
            const SizedBox(height: 10),
            const Text(
              'Amount Paid',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),
            const Text(
              '\$183.78',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ticket()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child:  Text(
                'View Ticket',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(
                color: Colors.white, thickness: 1, indent: 40, endIndent: 40),
            const SizedBox(height: 10),
            const Text(
              'How was your payment experience?',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.thumb_up, color: Colors.white, size: 30),
                  onPressed: () {
                    // Handle positive feedback
                  },
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.thumb_down,
                      color: Colors.white, size: 30),
                  onPressed: () {
                    // Handle negative feedback
                  },
                ),
              ],
            ),
            const SizedBox(height: 30), // Add spacing at the bottom
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Share functionality
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.share, color: Colors.white),
      ),
    );
  }
}
