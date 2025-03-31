import 'package:flutter/material.dart';
import 'package:final_project/Bookflight.dart';
import 'package:final_project/Notification.dart';


class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _MainPageState();
}

class _MainPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFd9d9d9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 25),
              onPressed: () {
                Navigator.pop(context);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: const [
                        OfferCard(
                          imageUrl: 'https://media.connections.be/image/upload/c_fill,g_auto,q_auto:best,w_3840,f_auto//v1652357449/Destinations/Asia/Japan/TOURS/Discover%20Tokyo/Header_Fujiyoshida.jpg',
                          title: 'TRIP TO TOKYO, JAPAN',
                            subtitle : '''Phnom Penh - Japan round trip starts from\nKHR 1,000,000.00 - \$250.00
                                \nTokyo, officially the Tokyo Metropolis, is the capital and most populous city in Japan. With a population of over 14 million in the city proper in 2023, it is one of the most populous urban areas in the world. The Greater Tokyo Area, which includes Tokyo and parts of six neighboring prefectures, is the most populous metropolitan area in the world, with 41 million residents as of 2024.
                                \nLying at the head of Tokyo Bay, Tokyo is part of the Kantō region, on the central coast of Honshu, Japan's largest island. Tokyo serves as Japan's economic center and the seat of both the Japanese government and the Emperor of Japan. The Tokyo Metropolitan Government administers Tokyo's central 23 special wards, which formerly made up Tokyo City; various commuter towns and suburbs in its western area; and two outlying island chains, the Tokyo Islands. Although most of the world recognizes Tokyo as a city, since 1943 its governing structure has been more akin to that of a prefecture, with an accompanying Governor and Assembly taking precedence over the smaller municipal governments that make up the metropolis. Special wards in Tokyo include Chiyoda, the site of the National Diet Building and the Tokyo Imperial Palace; Shinjuku, the city's administrative center; and Shibuya, a hub of commerce and business.
                                \nBefore the 17th century, Tokyo, then known as Edo, was mainly a fishing village. It gained political prominence in 1603 when it became the seat of the Tokugawa shogunate. By the mid-18th century, Edo was among the world's largest cities, with over a million residents. After the Meiji Restoration (1868), the imperial capital in Kyoto was moved to Edo, and the city was renamed Tokyo (lit. 'Eastern Capital'). In 1923, Tokyo was greatly damaged by the Great Kantō earthquake, and the city was later badly damaged by allied bombing raids during World War II. Beginning in the late 1940s, Tokyo underwent rapid reconstruction and expansion, which fueled the Japanese economic miracle, in which Japan's economy became the second largest in the world at the time, behind that of the United States. As of 2023, the city is home to 29 of the world's 500 largest companies, as listed in the annual Fortune Global 500—the second highest number of any city.
                                \nTokyo became the first city in Asia to host the Summer Olympics and Paralympics, in 1964 and then in 2021. It also hosted three G7 summits, in 1979, 1986, and 1993. Tokyo is an international hub of research and development and an academic center, with several major universities, including the University of Tokyo, the top-ranking university in Japan. Tokyo Station is the central hub for the Shinkansen, the country's high-speed railway network; and the city's Shinjuku Station is the world's busiest train station. Tokyo Skytree is the world's tallest tower. The Tokyo Metro Ginza Line, which opened in 1927, is the oldest underground metro line in the Asia–Pacific region.
                                \nTokyo's nominal gross domestic output was 113.7 trillion yen (US\$1.04 trillion) in FY2021 and accounted for 20.7% of the country's total economic output, which converts to 8.07 million yen or US\$73,820 per capita. Including the Greater Tokyo Area, Tokyo is the second-largest metropolitan economy in the world after New York, with a 2022 gross metropolitan product estimated at US\$2.08 trillion. Although Tokyo's status as a leading global financial hub has diminished with the Lost Decades since the 1990s—when the Tokyo Stock Exchange (TSE) was the world's largest, with a market capitalization about 1.5 times that of the NYSE, the city is still a large financial hub, and the TSE remains among the world's top five major stock exchanges. Tokyo is categorized as an Alpha+ city by the Globalization and World Cities Research Network. The city is also recognized as one of the world's most livable ones; it was ranked fourth in the world in the 2021 edition of the Global Livability Ranking. Tokyo has also been ranked as the safest city in the world in multiple international surveys.
                                  '''
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter, // Align to bottom-center
            child: Padding(
              padding: const EdgeInsets.all(60.0), // Padding from bottom
              child: SizedBox(
                width: 240,
                height: 50,
                child: FloatingActionButton(
                  onPressed: () {
                    print('You Click ME!');
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Bookflight()));
                  },
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'BUY TICKET',
                    style: TextStyle(
                      letterSpacing: 2.0,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
                  style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
