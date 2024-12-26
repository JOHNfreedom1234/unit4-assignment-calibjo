import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bio(),
    );
  }
}

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double crossAxisSpacing = 8; // Space between items
    int crossAxisCount = (screenWidth / 150).floor();
    final details = [
      {'icon': Icons.cake, 'text': 'Birthdate: April 15, 2003'},
      {'icon': Icons.email, 'text': 'Email: joshuaprinze.calibjo@wvsu.edu.ph'},
      {'icon': Icons.book, 'text': 'Hobbies: Writing, Gaming, Coding, Reading'},
      {'icon': Icons.gamepad, 'text': 'Favorite Game: Minecraft'},
      {'icon': Icons.movie, 'text': 'Favorite Movie: Dune'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Introudcing Me!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('me.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Joshua Prinze Calibjo',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      const Text(
                        "'What's the Worst that could happen'?",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 26,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            const Text(
              "My Details at a Glance:",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),


            SizedBox(height: 5),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 20,
                  ),
                  itemCount: details.length,
                  itemBuilder: (content, index) {
                    return DetailBox(
                      icon: details[index]['icon'] as IconData,
                      text: details[index]['text'] as String,
                    );
                  }),
            ),


            SizedBox(height: 20),

            const Text(
              "My Bio:",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 16.0), // Space around the container
              padding: EdgeInsets.all(16.0), // Space inside the container
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 221, 236), // Background color
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 6.0,
                    offset: Offset(0, 3), // Subtle shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Well, this got delayed. Anyway, my name is Joshua Prinze C. Calibjo, and I'm currently a student at West Visayas State University, College of ICT, Bachelor of Science in Computer Science. So far I'm in my third year, trying to stay afloat despite repeated self-inflicted setbacks but I do try my best to keep on moving forward.",
                   style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  final IconData icon;
  final String text;

  DetailBox({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(171, 8, 205, 231),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 50),
          SizedBox(height: 8.0),
          Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
