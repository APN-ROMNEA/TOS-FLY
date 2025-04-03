import 'package:flutter/material.dart';
import 'package:final_project/successful.dart';

class TripSummaryPage extends StatefulWidget {
  const TripSummaryPage({super.key});

  @override
  State<TripSummaryPage> createState() => _TripSummaryPageState();
}

class _TripSummaryPageState extends State<TripSummaryPage> {
  String _selectedPaymentMethod = 'aba';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set the background color here
      appBar: AppBar(
        title: const Text('តោះហោះ', style: TextStyle(fontSize: 20, fontFamily: 'Moulpali', fontWeight: FontWeight.bold) ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trip Summary',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Flight header with flight number and duration
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'KH985',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Nonstop, 7h 30m',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Route and date
                        const Text(
                          'PNH · BKK',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text('Fri, 14 Feb, 6:00AM - 1:30PM'),
                        const Divider(),

                        // Flight timeline
                        Row(
                          children: [
                            Column(
                              children: const [
                                Text('6:00AM'),
                                Icon(Icons.circle, size: 8),
                                SizedBox(
                                    height: 50,
                                    width: 2,
                                    child: VerticalDivider(color: Colors.grey)),
                                Icon(Icons.circle, size: 8),
                                Text('1:30PM'),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'PNH',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'International Airport, PP\nTerminal 4',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 16),
                                  Text(
                                    'BKK',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Suvarnabhumi Airport, TH\nTerminal 7',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(),

                        // Aircraft and class information
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'KH985',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'BOEING 737-700',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Basic (E)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Icon(Icons.wifi, size: 20),
                                SizedBox(width: 6),
                                Icon(Icons.usb, size: 20),
                                SizedBox(width: 6),
                                Icon(Icons.ondemand_video, size: 20),
                                SizedBox(width: 6),
                                Icon(Icons.power, size: 20),
                                SizedBox(width: 6),
                                Icon(Icons.headset, size: 20),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Meal services',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Snacks, Drink, Food for Purchase',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Payment section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trip Total',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1 Passenger',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$168',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Taxes, Fees & Charges',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$15.78',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Amount Due',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '\$183.78 USD',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Payment method selection
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(
                  top: 0, left: 16, right: 16, bottom: 16),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Payment Method',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PaymentSuccessfulPage()));
                    },
                    child: RadioListTile<String>(
                      value: 'aba',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                      secondary: Image.asset('assets/images/ic_ABA PAY_3x.png',
                          height: 50, width: 50),
                      title: const Text('ABA Pay'),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PaymentSuccessfulPage()));
                    },
                    child: RadioListTile<String>(
                      value: 'credit_card',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                      secondary: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/credit.png',
                              height: 120, width: 120),
                          const SizedBox(width: 8),
                        ],
                      ),
                      title: const Text('Credit Card'),
                    ),
                  ),
                  const Divider(),
                  GestureDetector(
                    onDoubleTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PaymentSuccessfulPage()));
                    },
                    child: RadioListTile<String>(
                      value: 'khqr',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                      secondary: Image.asset('assets/images/khqr.jpg',
                          height: 60, width: 60),
                      title: const Text('KHQR'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
