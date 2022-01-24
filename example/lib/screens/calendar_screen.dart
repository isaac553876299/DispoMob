import 'package:example/screens/day_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
        backgroundColor: Colors.white,
        title: Text(
          "Calendar",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: SfDateRangePicker(
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is DateTime) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DayScreen(date: args.value),
                  ),
                );
              }
            },
            selectionMode: DateRangePickerSelectionMode.single,
          ),
        ),
      ),
    );
  }
}
