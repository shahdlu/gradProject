import 'package:flutter/material.dart';

class Time1 extends StatefulWidget {
  const Time1({Key? key}) : super(key: key);

  @override
  _Time1State createState() => _Time1State();
}

class _Time1State extends State<Time1> {
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
                shadowColor: Color.fromARGB(255, 199, 199, 199),
                elevation: 4,
                primary: const Color.fromARGB(255, 255, 255, 255),
                side: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 255, 255, 255)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text(_timeOfDay.format(context).toString(),
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
