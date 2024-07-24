import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HoroscopeScreen(),
    );
  }
}

class HoroscopeScreen extends StatefulWidget {
  const HoroscopeScreen({super.key});

  @override
  HoroscopeScreenState createState() => HoroscopeScreenState();
}

class HoroscopeScreenState extends State<HoroscopeScreen> {
  String selectedDate = 'Today';
  final Map<String, String> horoscopes = {
    'Yesterday': 'You were practical and down-to-Earth...',
    'Today':
        'You’re usually a very practical and down-to-Earth person, but today you may be more inclined than usual toward mysticism. Spiritual matters seem extremely appealing, and you could find yourself gravitating toward metaphysical bookstores or seeking discussions with people who are well versed in such matters. You also find your imagination working overtime. Indulge in a few flights of fancy, Gemini. We all need to escape from time to time!',
    'Tomorrow': 'Be prepared for a surge of energy and creativity...'
  };
  final Color primaryColor = const Color.fromRGBO(76, 47, 95, 1);
  final Color secondaryColor = const Color.fromRGBO(76, 47, 95, 0.5);
  final Color secondaryColor2 = const Color.fromRGBO(76, 47, 95, 0.2);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width - 64;
    return Scaffold(
      appBar: AppBar(
        title: Text('Gemini',style: TextStyle(color: primaryColor),),
        centerTitle: true,
        backgroundColor: secondaryColor2,
      ),
      backgroundColor: const Color.fromRGBO(233, 222, 228, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Center(
                child: ToggleButtons(
                  isSelected: [
                    selectedDate == 'Yesterday',
                    selectedDate == 'Today',
                    selectedDate == 'Tomorrow'
                  ],
                  borderRadius: BorderRadius.circular(8),
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        selectedDate = 'Yesterday';
                      } else if (index == 1) {
                        selectedDate = 'Today';
                      } else if (index == 2) {
                        selectedDate = 'Tomorrow';
                      }
                    });
                  },
                  borderColor: Colors.black,
                  selectedBorderColor: Colors.black,
                  fillColor: Colors.transparent,
                  selectedColor: primaryColor,
                  color: secondaryColor,
                  children: List.generate(horoscopes.length, (index) => SizedBox(
                    width: w/3,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(horoscopes.keys.toList()[index],textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                  )),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  horoscopes[selectedDate] ?? '',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
