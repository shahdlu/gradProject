import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/screens/foodpart/search_field.dart';

import '../../theme/constants.dart';
import '../../widgets/button.dart';

class BreakfastScreen extends StatefulWidget {
  @override
  _BreakfastScreenState createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the previous screen
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Breakfast',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0, // Remove the bar under the title bar
        ),
        body: Column(
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('breakfast').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      var breakfast = snapshot.data?.docs[index];
                      var name = breakfast?['name'];
                      var kcal = breakfast?['kcal'];
                      var image = breakfast?['image'];
                      var desc = breakfast?['desc'];

                      return BreakFastListViewItem(
                        name: name,
                        kcal: kcal,
                        image: image,
                        desc: desc,
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: CalculateButton(
                  title: 'Add another food',
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (v) => const SearchField()));
                  },
                  buttonbackcolor: kButtonColor,
                  buttontextcolor: Colors.white),
            ),
          ],
        ));
  }
}

class BreakFastListViewItem extends StatelessWidget {
  const BreakFastListViewItem({
    super.key,
    required this.name,
    required this.desc,
    required this.image,
    required this.kcal,
  });

  final String name, desc, image, kcal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: const Color(0xffE5E2E2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Checkbox(
                  value: false,
                  onChanged: (newValue) {
                    // Handle checkbox state changes
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                Image.network(
                  image,
                  height: 90,
                  width: 90,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Calories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '$kcal cal',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
