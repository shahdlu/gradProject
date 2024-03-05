import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 35.0,
              height: 35.0,
              child: FloatingActionButton.small(
                onPressed: _decrementCounter,
                backgroundColor: Color(0xff163D77),
                child: Icon(
                  Icons.remove,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xff163D77),
                    ),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
            SizedBox(width: 10.0),
            AnimatedOpacity(
              opacity: _counter != 0 ? 1.0 : 0.0,
              duration: Duration(milliseconds: 100),
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            SizedBox(
              width: 35.0,
              height: 35.0,
              child: FloatingActionButton.small(
                onPressed: _incrementCounter,
                backgroundColor: Color(0xff163D77),
                child: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3,
                      color: Color(0xff163D77),
                    ),
                    borderRadius: BorderRadius.circular(100)),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 255, 255, 255),
        border: Border.all(
          color: Color(0xff163D77),
        ),
      ),
      width: 150,
      height: 60,
    );
  }
}
