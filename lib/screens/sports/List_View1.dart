import 'package:flutter/material.dart';

import 'Container.dart';


class List1 extends StatelessWidget {
  const List1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return  Container1(name: 'bassant', time: '', kcal: '', image1Url: '',);
          }),
    );
  }
}
