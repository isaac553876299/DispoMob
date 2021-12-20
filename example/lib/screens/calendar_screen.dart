import 'package:example/screens/day_screen.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[100],
        title: Text(
          "Calendar",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.teal[900],
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DayScreen(),
                    ),
                  );
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.cyan[100],
                ),
                child: Stack(
                  children: [
                    Text(
                      "$index",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[900],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Column(
                        children: [
                          MiniTask(color: Colors.pink),
                          const SizedBox(height: 2),
                          MiniTask(color: Colors.green),
                          const SizedBox(height: 2),
                          MiniTask(color: Colors.purpleAccent),
                          const SizedBox(height: 2),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 32,
        ),
      ),
    );
  }
}

class MiniTask extends StatelessWidget {
  final Color color;
  const MiniTask({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
