import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFd9d9d9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 0.0),
            child: Icon(Icons.account_circle, size: 30),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Center(
              child: Text(
                'TOS-FLY',
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
              child: Icon(Icons.notifications_sharp, size: 30),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/images/StarterPage.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent overlay to make text readable
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          // Foreground content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello There!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'TODAY OFFERS',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'For Cambodian People',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: const [
                        OfferCard(
                          imageUrl: 'https://media.connections.be/image/upload/c_fill,g_auto,q_auto:best,w_3840,f_auto//v1652357449/Destinations/Asia/Japan/TOURS/Discover%20Tokyo/Header_Fujiyoshida.jpg',
                          title: 'TRIP TO TOKYO, JAPAN',
                          subtitle: 'Phnom Penh - Japan round trip starts from \nKHR 1,000,000 - \$250',
                        ),
                        OfferCard(
                          imageUrl: 'https://www.agoda.com/wp-content/uploads/2024/08/Namsan-Tower-during-autumn-in-Seoul-South-Korea.jpg',
                          title: 'TRIP TO SEOUL, SOUTH KOREA',
                          subtitle: 'Phnom Penh - South Korea round trip starts from \nKHR 800,000 - \$200',
                        ),
                        OfferCard(
                          imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Palace_of_Westminster_from_the_dome_on_Methodist_Central_Hall_%28cropped%29.jpg/900px-Palace_of_Westminster_from_the_dome_on_Methodist_Central_Hall_%28cropped%29.jpg',
                          title: 'TRIP TO LONDON, ENGLAND',
                          subtitle: 'Phnom Penh - England round trip starts from \nKHR 3,000,000 - \$750',
                        ),
                        OfferCard(
                          imageUrl: 'https://www.topuniversities.com/sites/default/files/styles/736x304/public/guides/lead-bg-images/file%20%2837%29.jpg.webp',
                          title: 'TRIP TO RIO DE JENEIRO, BRAZIL',
                          subtitle: 'Phnom Penh - Brazil round trip starts from \nKHR 4000,000 - \$1000',
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
      bottomNavigationBar: SizedBox(
        height: 100,
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40, color: Color.fromARGB(255, 0, 85, 255)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flight_takeoff_outlined, size: 40),
              label: 'BOOK FLIGHT',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.luggage, size: 40),
              label: 'MY TRIPS',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_sharp, size: 40),
              label: 'MORE',
            ),
          ],
          selectedItemColor: const Color.fromARGB(255, 0, 85, 255),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontSize: 13),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OfferCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              imageUrl, 
              height: 200, 
              width: double.infinity, 
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / 
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, size: 50),
                );
              },
            ),
          ),
          Padding(
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
                  subtitle, 
                  style: TextStyle(
                    fontSize: 14, 
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w600, // Added semi-bold font weight
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