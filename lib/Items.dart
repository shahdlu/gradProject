import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 25),
      child: Container(
        width: 300,
        height: 70,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: Text(
                    "Pepperoni pizza",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  " 100g",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, right: 15),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_circle_outlined,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
