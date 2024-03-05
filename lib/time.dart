import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // create TimeOfDay variable
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

  // show time picker method
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: OutlinedButton(
              onPressed: _showTimePicker,
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 255, 255),
                side: BorderSide(width: 1.0, color: const Color(0xff163D77)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(_timeOfDay.format(context).toString(),
                    style: TextStyle(
                        color: const Color(0xff163D77), fontSize: 25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
