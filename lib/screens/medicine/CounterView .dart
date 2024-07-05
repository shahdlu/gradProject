import 'package:flutter/material.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/text.dart';

class CounterScreen extends StatefulWidget {
  final ValueChanged<double> onDosageChanged;

  const CounterScreen({super.key, required this.onDosageChanged});

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 0.5;
      widget.onDosageChanged(_counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter -= 0.5;
        widget.onDosageChanged(_counter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFFBFDFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 155,
      height: 60,
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: FloatingActionButton.small(
                onPressed: _decrementCounter,
                backgroundColor: kButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: _counter != 0 ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 100),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: TextTitle(
                  text: '$_counter',
                  textcolor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
              height: 30.0,
              child: FloatingActionButton.small(
                onPressed: _incrementCounter,
                backgroundColor: kButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
