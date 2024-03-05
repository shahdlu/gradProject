import 'package:flutter/material.dart';
import 'package:gradproj/Containerr.dart';

class List2 extends StatelessWidget {
  const List2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return  const Containerr();
          }),
    );
  }
}
