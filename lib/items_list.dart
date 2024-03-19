import 'package:flutter/material.dart';

import 'Items.dart';

class itemsList extends StatelessWidget {
  const itemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 550,
          width: 370,
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return const Items();
              }),
        ),
      ],
    );
  }
}
