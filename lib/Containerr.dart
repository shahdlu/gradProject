import 'package:flutter/material.dart';

class Containerr extends StatelessWidget {
  const Containerr({super.key});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '1');
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFFBFDFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: 140,
            //  color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(right: 70),
                child: CircleAvatar(
                  radius: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        'images/WhatsApp Image 2024-02-02 at 17.27.01_bdc5c33b.jpg'),
                    radius: 80,
                  ),
                ),
              ),
            ),
            Container(
              width: 150,
              height: 80,
            //  color: const Color.fromARGB(255, 255, 255, 255),
              margin: EdgeInsets.all(0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Text(
                      'Jumping Jacks',
                      style: TextStyle(
                        color: Color.fromARGB(230, 0, 0, 0),
                        fontSize: 16.5,
                        fontWeight: FontWeight.w700,
                        height: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        '00:20',
                        style: TextStyle(
                          color: Color.fromARGB(255, 212, 5, 5),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: const Text(
                          '8.5 Kcal',
                          style: TextStyle(
                            color: Color.fromARGB(255, 212, 5, 5),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
